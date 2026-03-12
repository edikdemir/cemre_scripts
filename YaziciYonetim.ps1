param(
    [string]$YaziciNo = "1",
    [ValidateSet("Kur","Onar")]
    [string]$Islem = "Kur"
)

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "BILGI"
    )
    $Time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "[$Time] [$Level] $Message"
}

Write-Log "=== Gelismis Yazici Yonetim Betigi Baslatildi ==="
Write-Log "Parametreler -> YaziciNo: '$YaziciNo' | Islem: '$Islem'"

switch ($YaziciNo) {
    "5869" {
        $PrinterIP   = "192.168.77.63"
        $PrinterName = "HP ProjeYonetim"
        $DriverName  = "HP PageWide MFP P77740-60z PCL 6 (V3)"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\HPPageWideP77740z"
        #HP PageWide MFP P77740-60z
    }
    "7885" {
        $PrinterIP   = "192.168.2.43"
        $PrinterName = "HP Uretim Yeni Prefabrik Ust Kat"
        $DriverName  = "HP PageWide MFP P77740-60z PCL 6 (V3)"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\HPPageWideP77740z"
        #HP PageWide MFP P77740-60z
    }
    "6926" {
        $PrinterIP   = "192.168.2.44"
        $PrinterName = "HP Idari Bina Giris Kat"
        $DriverName  = "HP PageWide MFP P77740-60z PCL 6 (V3)"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\HPPageWideP77740z"
        #HP PageWide MFP P77740-60z
    }
    "5385" {
        $PrinterIP   = "192.168.2.51"
        $PrinterName = "HP Planlama"
        $DriverName  = "HP PageWide MFP P77740-60z PCL 6 (V3)"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\HPPageWideP77740z"
        #HP PageWide MFP P77740-60z
    }
    "7684" {
        $PrinterIP   = "192.168.2.58"
        $PrinterName = "HP Kalite"
        $DriverName  = "HP PageWide MFP P77740-60z PCL 6 (V3)"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\HPPageWideP77740z"
        #HP PageWide MFP P77740-60z
    }
    "2081" {
        $PrinterIP   = "192.168.5.44"
        $PrinterName = "Donatim Kizakalti"
        $DriverName  = "HP PageWide MFP P77740-60z PCL 6 (V3)"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\HPPageWideP77740z"
        #HP PageWide MFP P77740-60z
    }
    "12127" {
        $PrinterIP   = "192.168.2.60"
        $PrinterName = "Insan Kaynaklari - Cemre1"
        $DriverName  = "Samsung X7600 Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX7400LX"
        #Samsung X7400X7600 Series
    }
    "7246" {
        $PrinterIP   = "192.168.7.200"
        $PrinterName = "Kizakalti-ISG"
        $DriverName  = "Samsung X7600 Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX7400LX"
        #Samsung X7400X7600 Series
    }
    "7872" {
        $PrinterIP   = "192.168.5.57"
        $PrinterName = "Eski Uretim Ust Kat"
        $DriverName  = "Samsung X7600 Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX7400LX"
        #Samsung X7400X7600 Series
    }
    "1247" {
        $PrinterIP   = "192.168.2.86"
        $PrinterName = "Idari Isler - Cemre2"
        $DriverName  = "Samsung X7600 Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX7400LX"
        #Samsung X7400X7600 Series
    }
    "13614" {
        $PrinterIP   = "192.168.4.41"
        $PrinterName = "Cemre3 OSGB"
        $DriverName  = "Samsung X7600 Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX7400LX"
        #Samsung X7400X7600 Series
    }
    "7065" {
        $PrinterIP   = "192.168.2.53"
        $PrinterName = "Muhasebe-1"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "7024" {
        $PrinterIP   = "192.168.2.87"
        $PrinterName = "Muhasebe-2"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "7699" {
        $PrinterIP   = "192.168.5.43"
        $PrinterName = "BAKIMONARIM"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "7042" {
        $PrinterIP   = "192.168.5.54"
        $PrinterName = "Finans"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "13600" {
        $PrinterIP   = "192.168.2.63"
        $PrinterName = "Alt YUklenici Ofisi"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "13609" {
        $PrinterIP   = "192.168.5.52"
        $PrinterName = "Boya Ofisi"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "13603" {
        $PrinterIP   = "192.168.2.61"
        $PrinterName = "Guvenlik - Cemre1"
        $DriverName = "Samsung M458x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungM4583FX"
        #Samsung M458x Series
    }
    "2242" {
        $PrinterIP   = "192.168.5.47"
        $PrinterName = "Revir - Cemre2"
        $DriverName = "Samsung C406x Series"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung C406x Series
    }
    "7982" {
        $PrinterIP   = "192.168.2.42"
        $PrinterName = "Donatim"
        $DriverName = "Samsung X4300_SeriesE5DF"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung X4300
    }
    "7025" {
        $PrinterIP   = "192.168.2.68"
        $PrinterName = "Muhasebe-Operas"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "7705" {
        $PrinterIP   = "192.168.2.76"
        $PrinterName = "Depo - Cemre1"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "7332" {
        $PrinterIP   = "192.168.2.89"
        $PrinterName = "Revir - Cemre1"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "7989" {
        $PrinterIP   = "192.168.2.99"
        $PrinterName = "Interior - Cemre1"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "2681" {
        $PrinterIP   = "192.168.2.55"
        $PrinterName = "ISG"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "3896" {
        $PrinterIP   = "192.168.2.62"
        $PrinterName = "Depo - Cemre2"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "4425" {
        $PrinterIP   = "192.168.6.46"
        $PrinterName = "CNC - Cemre2"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung M4075 Series
    }
    "5579" {
        $PrinterIP   = "192.168.2.85"
        $PrinterName = "Celik Ofis"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung 3280 Series
    }
    "7837" {
        $PrinterIP   = "192.168.2.56"
        $PrinterName = "Samsung Eski Uretim Zemin Kat"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung 3280 Series
    }
    "1710" {
        $PrinterIP   = "192.168.2.41"
        $PrinterName = "Samsung Eski Uretim Ust Kat"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung 3280 Series
    }
    "97" {
        $PrinterIP   = "192.168.2.46"
        $PrinterName = "Samsung Yeni Prefabrik"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung 3280 Series
    }
    "3280" {
        $PrinterIP   = "192.168.28.30"
        $PrinterName = "MusteriOfisleri - Cemre2"
        $DriverName = "Samsung Universal Print Driver 3"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungX3280NR"
        #Samsung 3280 Series
    }
    "13604" {
        $PrinterIP   = "192.168.6.76"
        $PrinterName = "Cemre1-Dizayn"
        $DriverName = "Samsung Universal Print Driver 3 PS"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungCLX9301"
        #Samsung 9301 Series
    }
    "4861" {
        $PrinterIP   = "192.168.2.45"
        $PrinterName = "KapalıSahaPres"
        $DriverName = "Samsung Universal Print Driver 3 PS"
        $DriverPath  = "\\dosyasunucusu\BT_ARACLAR\YAZICILAR\TACTICAL\SamsungCLX9301"
        #Samsung 9301 Series
    }
    default {
        Write-Log "Tanimsiz yazici numarasi: $YaziciNo" "KRITIK"
        exit 1
    }
}

$PortName = "IP_$PrinterIP"

function Find-PrinterByPort {
    param([string]$PortName)
    return Get-Printer -ErrorAction SilentlyContinue |
           Where-Object { $_.PortName -eq $PortName } |
           Select-Object -First 1
}

function Ensure-PrinterPort {
    param(
        [string]$PortName,
        [string]$PrinterIP
    )

    $existingPort = Get-PrinterPort -Name $PortName -ErrorAction SilentlyContinue
    if (-not $existingPort) {
        Write-Log "Port olusturuluyor: $PortName -> $PrinterIP"
        Add-PrinterPort -Name $PortName -PrinterHostAddress $PrinterIP -ErrorAction Stop
    } else {
        Write-Log "Port zaten mevcut: $PortName"
    }
}

function Ensure-PrinterDriver {
    param(
        [string]$DriverName,
        [string]$DriverPath
    )

    $driverExists = Get-PrinterDriver -Name $DriverName -ErrorAction SilentlyContinue
    if ($driverExists) {
        Write-Log "Surucu zaten kurulu: $DriverName"
        return
    }

    if (-not (Test-Path $DriverPath)) {
        throw "Surucu yolu bulunamadi veya erisim yok: $DriverPath"
    }

    Write-Log "INF dosyalari ekleniyor..."
    $pnpResult = pnputil.exe /add-driver "$DriverPath\*.inf" /subdirs /install 2>&1
    $pnpResult | ForEach-Object { Write-Log "$_" "PNP" }

    Start-Sleep -Seconds 2

    $driverExists = Get-PrinterDriver -Name $DriverName -ErrorAction SilentlyContinue
    if (-not $driverExists) {
        Add-PrinterDriver -Name $DriverName -ErrorAction Stop
    }

    $driverExists = Get-PrinterDriver -Name $DriverName -ErrorAction SilentlyContinue
    if (-not $driverExists) {
        throw "Surucu yuklenemedi: $DriverName"
    }

    Write-Log "Surucu hazir: $DriverName"
}

function Ensure-PrinterInstalled {
    param(
        [string]$PrinterName,
        [string]$DriverName,
        [string]$PortName
    )

    $printer = Get-Printer -Name $PrinterName -ErrorAction SilentlyContinue
    if ($printer) {
        Write-Log "Yazici zaten mevcut: $PrinterName"
        if ($printer.PortName -ne $PortName) {
            Write-Log "Port guncelleniyor: $($printer.PortName) -> $PortName"
            Set-Printer -Name $PrinterName -PortName $PortName -ErrorAction Stop
        }
        return
    }

    Write-Log "Yazici ekleniyor: $PrinterName"
    Add-Printer -Name $PrinterName -DriverName $DriverName -PortName $PortName -ErrorAction Stop
    Write-Log "Yazici eklendi: $PrinterName"
}

try {
    switch ($Islem) {
        "Kur" {
            Write-Log "Kurulum baslatildi: $PrinterName ($PrinterIP)"
            Ensure-PrinterDriver -DriverName $DriverName -DriverPath $DriverPath
            Ensure-PrinterPort -PortName $PortName -PrinterIP $PrinterIP
            Ensure-PrinterInstalled -PrinterName $PrinterName -DriverName $DriverName -PortName $PortName
            Write-Log "SONUC: Kurulum basarili." "BASARILI"
            exit 0
        }

        "Onar" {
            Write-Log "Onarim baslatildi: $PrinterName"

            $printer = Get-Printer -Name $PrinterName -ErrorAction SilentlyContinue

            if (-not $printer) {
                Write-Log "Yazici '$PrinterName' bulunamadi, porta gore araniyor: $PortName" "UYARI"
                $printer = Find-PrinterByPort -PortName $PortName
            }

            if (-not $printer) {
                Write-Log "Hicbir eslesen yazici bulunamadi. Kurulum baslatiliyor..." "UYARI"
                Ensure-PrinterDriver -DriverName $DriverName -DriverPath $DriverPath
                Ensure-PrinterPort   -PortName $PortName -PrinterIP $PrinterIP
                Ensure-PrinterInstalled -PrinterName $PrinterName -DriverName $DriverName -PortName $PortName
                Write-Log "SONUC: Kurulum ile onarim tamamlandi." "BASARILI"
                exit 0
            }

            $foundName = $printer.Name
            if ($foundName -ne $PrinterName) {
                Write-Log "Yazici farkli isimle bulundu: '$foundName'" "UYARI"
            }

            Ensure-PrinterPort -PortName $PortName -PrinterIP $PrinterIP

            if ($printer.PortName -ne $PortName) {
                Set-Printer -Name $foundName -PortName $PortName -ErrorAction Stop
                Write-Log "Port duzeltildi: $($printer.PortName) -> $PortName"
            } else {
                Write-Log "Yazici zaten dogru portta."
            }

            Write-Log "SONUC: Onarim basarili." "BASARILI"
            exit 0
        }
    }
}
catch {
    Write-Log "ISLEM SIRASINDA HATA OLUSTU." "HATA"
    Write-Log "Hata Detayi: $($_.Exception.Message)" "HATA-DEBUG"
    exit 1
}
