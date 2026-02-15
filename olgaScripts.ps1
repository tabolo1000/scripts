# Изменяем яркость на 100% (Визуальный тест "света")
$brightness = 100
$delay = 0
$display = Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorBrightnessMethods
Invoke-CimMethod $display -MethodName WmiSetBrightness -Arguments @{Brightness = $brightness; Timeout = $delay}

# Ждем 5 секунд
Start-Sleep -Seconds 5

# Возвращаем яркость на 50%
Invoke-CimMethod $display -MethodName WmiSetBrightness -Arguments @{Brightness = 50; Timeout = $delay}

# Создаем текстовый лог для проверки в файлах
Add-Content -Path "C:\remote_test_log.txt" -Value "Code executed successfully at $(Get-Date)"
