
# Daniel T. K. W.
# Clear the terminal initially
Clear-Host

# --------------------------------------------------
# Functions
# --------------------------------------------------
function Find-PythonInstallations {
    Write-Host "Scanning for Python installations..."
    $pythonExes = Get-ChildItem -Path C:\ -Filter python.exe -Recurse -ErrorAction SilentlyContinue | Select-Object DirectoryName
    foreach ($exe in $pythonExes) {
        Write-Host "Found Python at: $($exe.DirectoryName)"
    }
    return $pythonExes
}

function Get-CommonPackages($pythonPaths) {
    Write-Host "Determining common packages across all installations..."
    $commonPackages = @{}
    foreach ($path in $pythonPaths) {
        $packages = & "$path\python.exe" -m pip list --format=freeze
        foreach ($package in $packages) {
            $packageName = $package.Split('=')[0]
            $commonPackages[$packageName] = $commonPackages[$packageName] + 1
        }
    }
    return $commonPackages.Keys | Where-Object { $commonPackages[$_] -eq $pythonPaths.Count }
}

function Standardize-Packages($pythonPaths, $commonPackages) {
    Write-Host "Standardizing packages..."
    foreach ($path in $pythonPaths) {
        foreach ($package in $commonPackages) {
            & "$path\python.exe" -m pip install $package --upgrade --force-reinstall
        }
    }
}

function Update-AllPackages($pythonPaths) {
    Write-Host "Updating all packages..."
    foreach ($path in $pythonPaths) {
        # Correcting the approach for checking outdated packages
        $outdatedPackages = & "$path\python.exe" -m pip list --outdated | Select-String -Pattern "\S+" -AllMatches | ForEach-Object { $_.Matches[0].Value.Split(' ')[0] }
        foreach ($package in $outdatedPackages) {
            & "$path\python.exe" -m pip install --upgrade --force-reinstall $package
        }
    }
}

# --------------------------------------------------
# Execution
# --------------------------------------------------
Clear-Host
$pythonPaths = Find-PythonInstallations | ForEach-Object { $_.DirectoryName }
Clear-Host
$commonPackages = Get-CommonPackages $pythonPaths
Clear-Host
Standardize-Packages $pythonPaths $commonPackages
Clear-Host
Update-AllPackages $pythonPaths

# --------------------------------------------------
# Commentary
# --------------------------------------------------
# This script includes several functional blocks to find Python installations, standardize packages across them, and update all packages.
# It handles the 'outdated' pip command differently to avoid the errors previously encountered.
# Clears the terminal after each major step to manage output clarity.



