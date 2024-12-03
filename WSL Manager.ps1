
function List-AvailableWSLDistros {
    wsl --list --online --quiet
}


function List-InstalledWSLDistros {
    wsl --list --quiet
}


function Start-WSLDistro {
    param (
        [string]$distroName
    )

    Write-Host "Starting $distroName..."
    wsl --distribution $distroName
}


function Stop-WSLDistro {
    param (
        [string]$distroName
    )

    Write-Host "Stopping $distroName..."
    wsl --terminate $distroName
}


function Uninstall-WSLDistro {
    param (
        [string]$distroName
    )

    Write-Host "Uninstalling $distroName..."
    wsl --unregister $distroName
}


function List-AvailableWSLVersions {
    wsl --list --online --quiet --verbose
}


function Set-WSLDefaultVersion {
    param (
        [string]$version
    )

    Write-Host "Setting default WSL version to $version..."
    wsl --set-default-version $version
}


function Show-SystemInfo {
    Write-Host "System Information:"
    systeminfo
}


function Show-WSLDiskUsage {
    wsl --list --verbose
}


function Update-WSLDistros {
    Write-Host "Updating installed WSL distros..."
    wsl --update
}


function Open-WindowsTerminal {
    Start-Process "wt.exe"
}

function Exit-Script {
    Write-Host "Exiting WSL Command Line. Goodbye!"
    exit
}


function Show-Help {
    Write-Host "Available Commands:"
    Write-Host "--distros       : List available WSL distros for download"
    Write-Host "--installed     : List installed WSL distros"
    Write-Host "--install <distro name>       : Install a WSL distro"
    Write-Host "--start <distro name>         : Start a specific WSL distro"
    Write-Host "--stop <distro name>          : Stop a specific WSL distro"
    Write-Host "--uninstall <distro name>     : Uninstall a specific WSL distro"
    Write-Host "--versions      : List available WSL versions for download"
    Write-Host "--set-version <version number>: Set default WSL version"
    Write-Host "--sysinfo       : Display system information"
    Write-Host "--disk-usage    : Display disk space usage for WSL"
    Write-Host "--update        : Update installed WSL distros"
    Write-Host "--terminal      : Open Windows Terminal"
    Write-Host "--exit          : Exit the script"
    Write-Host "--help          : Show available commands"
}


Write-Host "Welcome to WSL Command Line Type --help To See Available Commands"


while ($true) {
    
    $inputCommand = Read-Host "wsl>"

    if ($inputCommand -eq "--distros") {
        List-AvailableWSLDistros
    }

    elseif ($inputCommand -eq "--installed") {
        List-InstalledWSLDistros
    }

    elseif ($inputCommand.StartsWith("--install")) {
        $distroName = $inputCommand.Substring(10).Trim()
        Install-WSLDistro -distroName $distroName
    }

    elseif ($inputCommand.StartsWith("--start")) {
        $distroName = $inputCommand.Substring(8).Trim()
        Start-WSLDistro -distroName $distroName
    }

    elseif ($inputCommand.StartsWith("--stop")) {
        $distroName = $inputCommand.Substring(7).Trim()
        Stop-WSLDistro -distroName $distroName
    }

    elseif ($inputCommand.StartsWith("--uninstall")) {
        $distroName = $inputCommand.Substring(12).Trim()
        Uninstall-WSLDistro -distroName $distroName
    }

    elseif ($inputCommand -eq "--versions") {
        List-AvailableWSLVersions
    }

    elseif ($inputCommand.StartsWith("--set-version")) {
        $version = $inputCommand.Substring(14).Trim()
        Set-WSLDefaultVersion -version $version
    }

    elseif ($inputCommand -eq "--sysinfo") {
        Show-SystemInfo
    }

    elseif ($inputCommand -eq "--disk-usage") {
        Show-WSLDiskUsage
    }

    elseif ($inputCommand -eq "--update") {
        Update-WSLDistros
    }

    elseif ($inputCommand -eq "--terminal") {
        Open-WindowsTerminal
    }

    elseif ($inputCommand -eq "--exit") {
        Exit-Script
    }

    elseif ($inputCommand -eq "--help") {
        Show-Help
    }

    else {
        Write-Host "Invalid command. Please try again or type --help for available commands."
    }
}
