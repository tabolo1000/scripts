# Находим устройство тачпада по части имени
$touchpad = Get-PnpDevice | Where-Object { $_.FriendlyName -like "*TouchPad*" -or $_.Description -like "*TouchPad*" }

if ($touchpad) {
    # Отключаем устройство
    Disable-PnpDevice -InstanceId $touchpad.InstanceId -Confirm:$false
    
    # Лог для проверки
    Add-Content -Path "$env:TEMP\touchpad_check.txt" -Value "Тачпад отключен удаленно: $(Get-Date)"
    Write-Host "Тачпад ($($touchpad.FriendlyName)) деактивирован."
} else {
    Write-Warning "Устройство тачпада не найдено."
}
