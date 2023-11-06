foreach ($process in (Get-WmiObject Win32_Process -Filter "name = 'chocolate-doom.exe'"))
{
    if ($process.CommandLine -match "-dedicated")
    {
        Write-Host -ForegroundColor Green "Server running with PID $($process.ProcessId)";
        Write-Host -ForegroundColor Green "Killing chocolate-doom server...";
        Stop-Process -Id $process.ProcessId;
        try {
            Wait-Process -Id $process.ProcessId -ErrorAction SilentlyContinue;
        }
        catch {
            # Process already stopped, no need to wait...
        }
        Write-Host -ForegroundColor Green "(⌐■_■)>⌐`nServer has been terminated...";
        return;
    }
}
Write-Host -ForegroundColor Red "( •_•)>⌐■-■`nUnable to find a running chcolate-doom server..."