$scriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

Import-Module "$scriptPath\Modules\posh-git\src\posh-git.psd1"
Import-Module z

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}


## Posh-Git config prompt

# User Name
$promptPrefix = Write-Prompt -Object "$([System.Environment]::UserName)" -ForegroundColor "Blue"
# Machine Name
$promptPrefix += Write-Prompt -Object " @ $([System.Environment]::MachineName)" -ForegroundColor "Blue"
# Date Time
$promptPrefix += Write-Prompt -Object ' [$(Get-Date -Format G)]' -ForegroundColor "Gray"
# Break Line
$promptPrefix += '`n'

# Set prompt prefix (first line)
$GitPromptSettings.DefaultPromptPrefix.Text = $promptPrefix

# Break Line (before prompt symbol)
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'

# Prompt Symbol
$promptSymbol = Write-Prompt -Object "$([char]::ConvertFromUtf32(5125)) " -ForegroundColor "Blue"

# Nested Prompt Level
if ($nestedPromptLevel > 0) {
  $promptSymbol += "$(">" * ($nestedPromptLevel)) "
}

# Set prompt symbol
$GitPromptSettings.DefaultPromptSuffix.Text = $promptSymbol


## Set Aliases

# Git

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
#Add-Alias rs 'git reset'
Add-Alias rb 'git rebase'
#Add-Alias fixup 'git fixup'
Add-Alias branch 'git branch'
#Add-Alias tag 'git tag'
Add-Alias gk 'gitk'
Add-Alias cl 'git clone'
Add-Alias remote 'git remote'
Add-Alias gspushp 'git subtree push --prefix'

# Unix 

Add-Alias l 'ls'
Add-Alias ll 'ls -Force'
Add-Alias c 'clear'

# SQLLocalDB

Add-Alias sld 'SqlLocalDB'
Add-Alias sldi 'SqlLocalDB i' # info
Add-Alias slds 'SqlLocalDB s' # start
Add-Alias sldp 'SqlLocalDB p' # stop
Add-Alias sldv 'SqlLocalDB v' # versions

# Docker

Add-Alias dk 'docker'
