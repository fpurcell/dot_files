while ($true) {
    Write-Output "Keeping Awake... $(Get-Date)"
    Start-Process notepad
    sleep -Seconds 1
    Stop-Process -Name notepad
    sleep -Seconds 300
}
