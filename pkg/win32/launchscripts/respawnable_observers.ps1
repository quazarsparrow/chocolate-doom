param (
    [String]$iwad = $null,
    [String]$Server = $null,
    [String]$Port = $null
)

if ( -not $iwad)
{
    if ( $Env:DOOM_WAD )
    {
        $iwad = $Env:DOOM_WAD;
    }
    else
    {
        $iwad = '../doom1.wad'
    }
}

if ( -not $Port)
{
    if ( $Env:DOOM_PORT )
    {
        $Port = $Env:DOOM_PORT;
    }
    else
    {
        $Port = '666'
    }
}

if ( -not $Server )
{
    if( $env:DOOM_SERVER )
    {
        $Server = $Env:DOOM_SERVER;
    }
    else
    {
        $Server = 'localhost'
    }
}

$playeridx = 0;
$playername = 'Player1';
$obs1 = Start-Process -PassThru -NoNewWindow -FilePath ".\chocolate-doom.exe" -ArgumentList "-width 640 -height 480 -nomonsters -nograbmouse -nomouse -connect `"$Server`" -port $Port -drone -player $playername -playeridx $playeridx -iwad `"$iwad`"";
Write-Host -ForegroundColor Green "Observer 1 ($playername) started with PID: $($obs1.Id)";

$playeridx = 1;
$playername = 'Player2';
$obs2 = Start-Process -PassThru -NoNewWindow -FilePath ".\chocolate-doom.exe" -ArgumentList "-width 640 -height 480 -nomonsters -nograbmouse -nomouse -connect `"$Server`" -port $Port -drone -player $playername -playeridx $playeridx -iwad `"$iwad`"";
Write-Host -ForegroundColor Green "Observer 2 ($playername) started with PID: $($obs2.Id)";
