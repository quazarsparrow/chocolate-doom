$process = Start-Process -PassThru -NoNewWindow -FilePath ".\chocolate-doom.exe" -ArgumentList "-dedicated -port 666";
if ($process)
{
    Write-Host -ForegroundColor Green "Server running with PID $($process.Id)";
}
else
{
    Write-Host -ForegroundColor Red "Failed to start dedicated server."
}