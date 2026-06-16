# Self-elevate to admin if not running as admin
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    $scriptPath = $MyInvocation.MyCommand.Path
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$exePath = Join-Path $scriptDir "电脑主板型号修改软件v3.1.exe"
$runAsDate = Join-Path $scriptDir "RunAsDate.exe"

Write-Host "===================================="
Write-Host " DMIEdit Patched v5.27 - Launcher"
Write-Host "===================================="
Write-Host ""
Write-Host "Date faking to 01/01/2022 to bypass time check..."
Write-Host ""

& $runAsDate "01/01/2022" $exePath

Write-Host ""
Write-Host "If program closed unexpectedly, run manually as admin."
Read-Host "Press Enter to exit"