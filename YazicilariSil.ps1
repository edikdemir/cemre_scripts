#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Bilgisayardaki tum yazicilari silen PowerShell scripti.

.DESCRIPTION
    - Korunan yazicilar (Microsoft Print to PDF, XPS Document Writer, OneNote, Fax) silinmez
    - -Onayla parametresi olmadan sadece listeleme yapar, hicbir sey silmez
    - Silme oncesi yazdirma kuyrugunu temizler, Spooler servisini durdurur/baslatir
    - -PortlariSil ile kullanilmayan yazici portlarini da kaldirir
    - -SuruculeriSil ile kullanilmayan yazici suruculerini de kaldirir
    - YaziciYonetim.ps1 ile tutarli Write-Log loglama yapisi kullanir
    - Hata durumunda Spooler servisi otomatik yeniden baslatilir
    - Yonetici hakki ile calistirilmasi zorunludur

.PARAMETER Onayla
    Bu parametre verilmeden script sadece silinecek yazicilari listeler, silme islemi yapmaz.

.PARAMETER PortlariSil
    Yazicilar silindikten sonra baska yazici tarafindan kullanilmayan portlari da siler.

.PARAMETER SuruculeriSil
    Yazicilar silindikten sonra baska yazici tarafindan kullanilmayan suruculeri de siler.

.EXAMPLE
    .\YazicilariSil.ps1
    Sadece silinecek yazicilari listeler, silme yapmaz.

.EXAMPLE
    .\YazicilariSil.ps1 -Onayla
    Tum yazicilari siler (korunanlar haric).

.EXAMPLE
    .\YazicilariSil.ps1 -Onayla -PortlariSil
    Yazicilari ve kullanilmayan portlari siler.

.EXAMPLE
    .\YazicilariSil.ps1 -Onayla -PortlariSil -SuruculeriSil
    Yazicilari, portlari ve suruculeri tamamen temizler.
#>

param(
    [switch]$Onayla,
    [switch]$PortlariSil,
    [switch]$SuruculeriSil
)

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "BILGI"
    )
    $Time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "[$Time] [$Level] $Message"
}

Write-Log "=== Tum Yazicilari Silme Betigi Baslatildi ==="
Write-Log "Parametreler -> Onayla: $Onayla | PortlariSil: $PortlariSil | SuruculeriSil: $SuruculeriSil"

# Korunan yazicilar - bunlar silinmez
$KorunanYazicilar = @(
    "Microsoft Print to PDF",
    "Microsoft XPS Document Writer",
    "OneNote",
    "Fax"
)

try {
    # Mevcut yazicilari listele
    $tumYazicilar = Get-Printer -ErrorAction Stop
    $silinecekYazicilar = $tumYazicilar | Where-Object { $KorunanYazicilar -notcontains $_.Name }

    Write-Log "Toplam yazici sayisi: $($tumYazicilar.Count)"
    Write-Log "Korunan yazici sayisi: $($tumYazicilar.Count - $silinecekYazicilar.Count)"
    Write-Log "Silinecek yazici sayisi: $($silinecekYazicilar.Count)"

    if ($silinecekYazicilar.Count -eq 0) {
        Write-Log "Silinecek yazici bulunamadi." "UYARI"
        exit 0
    }

    Write-Log "--- Silinecek Yazicilar ---"
    $silinecekYazicilar | ForEach-Object {
        Write-Log "  - $($_.Name) | Port: $($_.PortName) | Surucu: $($_.DriverName)"
    }

    # Onay kontrolu
    if (-not $Onayla) {
        Write-Log "Onay parametresi verilmedi. Yazicilari silmek icin -Onayla parametresini kullanin." "UYARI"
        Write-Log "Ornek: .\YazicilariSil.ps1 -Onayla" "UYARI"
        Write-Log "Tum portlari da silmek icin: .\YazicilariSil.ps1 -Onayla -PortlariSil" "UYARI"
        Write-Log "Tum suruculeri de silmek icin: .\YazicilariSil.ps1 -Onayla -PortlariSil -SuruculeriSil" "UYARI"
        exit 0
    }

    # Yazdirma biriktiricisini durdur
    Write-Log "Yazdirma Biriktiricisi (Spooler) durduruluyor..."
    Stop-Service -Name Spooler -Force -ErrorAction Stop
    Write-Log "Spooler durduruldu."

    # Yazdirma kuyruklarini temizle
    $spoolPath = "$env:SystemRoot\System32\spool\PRINTERS"
    if (Test-Path $spoolPath) {
        $spoolFiles = Get-ChildItem -Path $spoolPath -ErrorAction SilentlyContinue
        if ($spoolFiles.Count -gt 0) {
            Remove-Item -Path "$spoolPath\*" -Force -ErrorAction SilentlyContinue
            Write-Log "Yazdirma kuyrugu temizlendi ($($spoolFiles.Count) dosya)."
        }
    }

    # Spooler'i tekrar baslat
    Start-Service -Name Spooler -ErrorAction Stop
    Start-Sleep -Seconds 2
    Write-Log "Spooler yeniden baslatildi."

    # Yazicilari sil
    $basarili = 0
    $basarisiz = 0
    $silinenPortlar = @()
    $silinenSuruculer = @()

    foreach ($yazici in $silinecekYazicilar) {
        try {
            $portAdi = $yazici.PortName
            $surucuAdi = $yazici.DriverName

            Remove-Printer -Name $yazici.Name -ErrorAction Stop
            Write-Log "Yazici silindi: $($yazici.Name)" "BASARILI"
            $basarili++

            # Port bilgisini kaydet
            if ($portAdi -and $silinenPortlar -notcontains $portAdi) {
                $silinenPortlar += $portAdi
            }
            # Surucu bilgisini kaydet
            if ($surucuAdi -and $silinenSuruculer -notcontains $surucuAdi) {
                $silinenSuruculer += $surucuAdi
            }
        }
        catch {
            Write-Log "Yazici silinemedi: $($yazici.Name) - $($_.Exception.Message)" "HATA"
            $basarisiz++
        }
    }

    # Portlari sil
    if ($PortlariSil -and $silinenPortlar.Count -gt 0) {
        Write-Log "--- Portlar Siliniyor ---"
        foreach ($port in $silinenPortlar) {
            try {
                # Portu kullanan baska yazici var mi kontrol et
                $portKullanan = Get-Printer -ErrorAction SilentlyContinue | Where-Object { $_.PortName -eq $port }
                if ($portKullanan) {
                    Write-Log "Port baska yazici tarafindan kullaniliyor, atlanıyor: $port" "UYARI"
                    continue
                }
                Remove-PrinterPort -Name $port -ErrorAction Stop
                Write-Log "Port silindi: $port" "BASARILI"
            }
            catch {
                Write-Log "Port silinemedi: $port - $($_.Exception.Message)" "HATA"
            }
        }
    }

    # Suruculeri sil
    if ($SuruculeriSil -and $silinenSuruculer.Count -gt 0) {
        Write-Log "--- Suruculer Siliniyor ---"
        foreach ($surucu in $silinenSuruculer) {
            try {
                # Surucuyu kullanan baska yazici var mi kontrol et
                $surucuKullanan = Get-Printer -ErrorAction SilentlyContinue | Where-Object { $_.DriverName -eq $surucu }
                if ($surucuKullanan) {
                    Write-Log "Surucu baska yazici tarafindan kullaniliyor, atlaniyor: $surucu" "UYARI"
                    continue
                }
                Remove-PrinterDriver -Name $surucu -ErrorAction Stop
                Write-Log "Surucu silindi: $surucu" "BASARILI"
            }
            catch {
                Write-Log "Surucu silinemedi: $surucu - $($_.Exception.Message)" "HATA"
            }
        }
    }

    # Ozet
    Write-Log "=== SONUC OZETI ==="
    Write-Log "Silinen yazici: $basarili"
    Write-Log "Basarisiz: $basarisiz"
    if ($basarisiz -eq 0) {
        Write-Log "Tum yazicilar basariyla silindi." "BASARILI"
        exit 0
    } else {
        Write-Log "Bazi yazicilar silinemedi." "UYARI"
        exit 1
    }
}
catch {
    # Spooler durduysa tekrar baslat
    $spoolerDurum = Get-Service -Name Spooler -ErrorAction SilentlyContinue
    if ($spoolerDurum -and $spoolerDurum.Status -ne 'Running') {
        Start-Service -Name Spooler -ErrorAction SilentlyContinue
        Write-Log "Spooler hata sonrasi yeniden baslatildi."
    }

    Write-Log "ISLEM SIRASINDA HATA OLUSTU." "HATA"
    Write-Log "Hata Detayi: $($_.Exception.Message)" "HATA-DEBUG"
    exit 1
}
