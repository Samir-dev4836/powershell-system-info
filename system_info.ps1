$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logPath = "$HOME\Desktop\SystemInfo_$date.txt"

$computerName = $env:COMPUTERNAME
$userName = $env:USERNAME
$osVersion = (Get-CimInstance Win32_OperatingSystem).Caption
$ram = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
$freeSpace = [math]::Round((Get-PSDrive C).Free / 1GB, 2)

Add-Content -Path $logPath -Value "Имя ПК: $computerName"
Add-Content -Path $logPath -Value "Пользователь: $userName"
Add-Content -Path $logPath -Value "ОС: $osVersion"
Add-Content -Path $logPath -Value "ОЗУ: $ram GB"
Add-Content -Path $logPath -Value "Свободно на диске C: $freeSpace GB"

Write-Host "Файл создан: $logPath"