$scriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
# Enable posh-git
if (Test-Path "$scriptPath\Modules\posh-git\profile.example.ps1") {
    . $scriptPath\Modules\posh-git\profile.example.ps1
}

Import-Module z
