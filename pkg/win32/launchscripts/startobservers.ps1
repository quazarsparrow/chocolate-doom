if ( -not $env:DOOM_WAD )
{
    $Env:DOOM_WAD = 'doom1.wad'
}

$playeridx = 0;
$playername = 'Player1';
$obs1 = Start-Process -PassThru -NoNewWindow -FilePath ".\chocolate-doom.exe" -ArgumentList "-width 640 -height 480 -nomonsters -nograbmouse -nomouse -connect localhost -port 666 -drone -player $playername -playeridx $playeridx -suddendeath -iwad `"$($Env:DOOM_WAD)`"";
Write-Host -ForegroundColor Green "Observer 1 ($playername) started with PID: $($obs1.Id)";

$playeridx = 1;
$playername = 'Player2';
$obs2 = Start-Process -PassThru -NoNewWindow -FilePath ".\chocolate-doom.exe" -ArgumentList "-width 640 -height 480 -nomonsters -nograbmouse -nomouse -connect localhost -port 666 -drone -player $playername -playeridx $playeridx -suddendeath -iwad `"$($Env:DOOM_WAD)`"";
Write-Host -ForegroundColor Green "Observer 1 ($playername) started with PID: $($obs2.Id)";