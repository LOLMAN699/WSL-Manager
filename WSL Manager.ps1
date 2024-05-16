##################### 
#                   #
#       made        #
#        by         #  
#     LOLMAN699     #
#                   #
#                   #
#                   #
#####################






# Function to list available WSL distros for download
function List-AvailableWSLDistros {
    wsl --list --online --quiet
}

# Function to list installed WSL distros
function List-InstalledWSLDistros {
    wsl --list --quiet
}

# Function to start a specific WSL distro
function Start-WSLDistro {
    param (
        [string]$distroName
    )

    Write-Host "Starting $distroName..."
    wsl --distribution $distroName
}

# Function to stop a specific WSL distro
function Stop-WSLDistro {
    param (
        [string]$distroName
    )

    Write-Host "Stopping $distroName..."
    wsl --terminate $distroName
}

# Function to uninstall a specific WSL distro
function Uninstall-WSLDistro {
    param (
        [string]$distroName
    )

    Write-Host "Uninstalling $distroName..."
    wsl --unregister $distroName
}

# Function to display available WSL versions for download
function List-AvailableWSLVersions {
    wsl --list --online --quiet --verbose
}

# Function to set the default WSL version
function Set-WSLDefaultVersion {
    param (
        [string]$version
    )

    Write-Host "Setting default WSL version to $version..."
    wsl --set-default-version $version
}

# Function to display system information
function Show-SystemInfo {
    Write-Host "System Information:"
    systeminfo
}

# Function to display disk space usage for WSL
function Show-WSLDiskUsage {
    wsl --list --verbose
}

# Function to update installed WSL distros
function Update-WSLDistros {
    Write-Host "Updating installed WSL distros..."
    wsl --update
}

# Function to open the Windows Terminal
function Open-WindowsTerminal {
    Start-Process "wt.exe"
}

# Function to exit the script
function Exit-Script {
    Write-Host "Exiting WSL Command Line. Goodbye!"
    exit
}

# Function to display available commands
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

# Main script
Write-Host "Welcome to WSL Command Line"

# Loop to continuously accept user input
while ($true) {
    # Get user input
    $inputCommand = Read-Host "wsl>"

    # Check if the user wants to view available WSL distros for download
    if ($inputCommand -eq "--distros") {
        List-AvailableWSLDistros
    }
    # Check if the user wants to view installed WSL distros
    elseif ($inputCommand -eq "--installed") {
        List-InstalledWSLDistros
    }
    # Check if the user wants to install a WSL distro
    elseif ($inputCommand.StartsWith("--install")) {
        $distroName = $inputCommand.Substring(10).Trim()
        Install-WSLDistro -distroName $distroName
    }
    # Check if the user wants to start a WSL distro
    elseif ($inputCommand.StartsWith("--start")) {
        $distroName = $inputCommand.Substring(8).Trim()
        Start-WSLDistro -distroName $distroName
    }
    # Check if the user wants to stop a WSL distro
    elseif ($inputCommand.StartsWith("--stop")) {
        $distroName = $inputCommand.Substring(7).Trim()
        Stop-WSLDistro -distroName $distroName
    }
    # Check if the user wants to uninstall a WSL distro
    elseif ($inputCommand.StartsWith("--uninstall")) {
        $distroName = $inputCommand.Substring(12).Trim()
        Uninstall-WSLDistro -distroName $distroName
    }
    # Check if the user wants to view available WSL versions for download
    elseif ($inputCommand -eq "--versions") {
        List-AvailableWSLVersions
    }
    # Check if the user wants to set the default WSL version
    elseif ($inputCommand.StartsWith("--set-version")) {
        $version = $inputCommand.Substring(14).Trim()
        Set-WSLDefaultVersion -version $version
    }
    # Check if the user wants to display system information
    elseif ($inputCommand -eq "--sysinfo") {
        Show-SystemInfo
    }
    # Check if the user wants to display disk space usage for WSL
    elseif ($inputCommand -eq "--disk-usage") {
        Show-WSLDiskUsage
    }
    # Check if the user wants to update installed WSL distros
    elseif ($inputCommand -eq "--update") {
        Update-WSLDistros
    }
    # Check if the user wants to open Windows Terminal
    elseif ($inputCommand -eq "--terminal") {
        Open-WindowsTerminal
    }
    # Check if the user wants to exit
    elseif ($inputCommand -eq "--exit") {
        Exit-Script
    }
    # Check if the user wants to see available commands
    elseif ($inputCommand -eq "--help") {
        Show-Help
    }
    # Display error message for invalid commands
    else {
        Write-Host "Invalid command. Please try again or type --help for available commands."
    }
}
