$env:POSH_THEMES_PATH = (Get-AppxPackage ohmyposh.cli).InstallLocation + "\themes"
oh-my-posh init pwsh --config slimfat | Invoke-Expression

function Enable-MSVC {
    # Bereits in dieser Shell geladen? Dann nichts tun
    # (spart Zeit und verhindert, dass PATH immer länger wird)
    if ($env:VSCMD_VER) { return }

    $vsDevCmd = "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\Common7\Tools\VsDevCmd.bat"

    if (-not (Test-Path $vsDevCmd)) {
        Write-Error "Visual Studio Build Tools not found."
        return
    }

    cmd.exe /c "`"$vsDevCmd`" -arch=x64 -host_arch=x64 && set" |
        ForEach-Object {
            if ($_ -match '^(.*?)=(.*)$') {
                [Environment]::SetEnvironmentVariable(
                    $matches[1],
                    $matches[2],
                    "Process"
                )
            }
        }

    Write-Host "MSVC environment enabled." -ForegroundColor Green
}

function nvim {
    Enable-MSVC
    & "C:\Program Files\Neovim\bin\nvim.exe" @args
}
