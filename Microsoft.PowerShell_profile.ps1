$scriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Enable posh-git

if (Test-Path "$scriptPath\Modules\posh-git\profile.example.ps1") {
    . $scriptPath\Modules\posh-git\profile.example.ps1
}

# z Module

Import-Module z

# Chocolatey profile

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}
