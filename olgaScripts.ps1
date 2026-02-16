# Сначала загружаем сборку
Add-Type -AssemblyName System.Windows.Forms

# Находим устройство тачпада по части имени
$touchpad = Get-PnpDevice | Where-Object { $_.FriendlyName -like "*TouchPad*" -or $_.Description -like "*TouchPad*" }

[System.Windows.Forms.MessageBox]::Show("«Оля, скинь мне описание неполадки в Viber. Подожди, пока я всё исправлю в этом файле, потом запусти его снова. Текущий скрипт отключает тачпад. Нажми 'Окей' для отключения и выхода;", "Жди!", "OK", "Information")


if ($touchpad) {
    # Отключаем устройство
    Disable-PnpDevice -InstanceId $touchpad.InstanceId -Confirm:$false
    
    # Лог для проверки
    Add-Content -Path "$env:TEMP\touchpad_check.txt" -Value "Тачпад отключен удаленно: $(Get-Date)"
    Write-Host "Тачпад ($($touchpad.FriendlyName)) деактивирован."

    [System.Windows.Forms.MessageBox]::Show("Отключение тачпада прошло успешно, никаких препятствий на пути не возникло!", "Задачу выпонил!", "OK", "Information")
} else {
    Write-Warning "Устройство тачпада не найдено."
    [System.Windows.Forms.MessageBox]::Show("Что-то пошло не так! Нужно углубится в тему!", "Задача не выполнена!", "OK", "Error")
}


exit