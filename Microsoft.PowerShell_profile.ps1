﻿$scriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

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

# Set Aliases

# - Git

function add {
    if ($args) {
        Invoke-Expression ( "git add " + ($args -join ' ') )
    } else {
        git add -A :/
    }
}
Add-Alias st 'git status'
Add-Alias push 'git push'
Add-Alias pull 'git pull'
Add-Alias log 'git log'
Add-Alias ci 'git commit'
Add-Alias co 'git checkout'
Add-Alias dif 'git diff'
Add-Alias rs 'git reset'
Add-Alias rb 'git rebase'
#Add-Alias fixup 'git fixup'
Add-Alias branch 'git branch'
Add-Alias tag 'git tag'

# - Unix 

Add-Alias l 'ls'
Add-Alias ll 'ls -Force'
Add-Alias c 'clear'
