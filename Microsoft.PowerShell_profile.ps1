$scriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

Import-Module "$scriptPath\Modules\posh-git\src\posh-git.psd1"
Import-Module z

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}


## PROMPT

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
if ($nestedPromptLevel -gt 0) {
  $promptSymbol += "$(">" * ($nestedPromptLevel)) "
}

# Set prompt symbol
$GitPromptSettings.DefaultPromptSuffix.Text = $promptSymbol


## ALIASES

# Git

function gadd {
    if ($args) {
        Invoke-Expression ( "git add " + ($args -join ' ') )
    } else {
        git add -A :/
    }
}
Add-Alias gbranch 'git branch'
Add-Alias gcl 'git clone'
Add-Alias gco 'git checkout'
Add-Alias gcob 'git checkout -b'
Add-Alias gct 'git commit'
Add-Alias gcta 'git commit --amend'
Add-Alias gcts 'git commit -S'
Add-Alias gctsv 'git commit -S -v'
Add-Alias gctv 'git commit -v'
Add-Alias gdif 'git diff'
Add-Alias gdiff 'git diff'
Add-Alias gfetch 'git fetch'
Add-Alias gk 'gitk'
Add-Alias glog 'git log'
Add-Alias glogo 'git log --oneline'
Add-Alias gpull 'git pull'
Add-Alias gpullr 'git pull -r'
Add-Alias gpush 'git push'
Add-Alias gpushf 'git push -f'
Add-Alias gpushu 'git push -u'
Add-Alias grb 'git rebase'
Add-Alias gremote 'git remote'
Add-Alias gremotev 'git remote -v'
Add-Alias gspushp 'git subtree push --prefix'
Add-Alias gst 'git status'
Add-Alias gsta 'git stash'
Add-Alias gstal 'git stash list'
Add-Alias gstap 'git stash pop'
Add-Alias gstau 'git stash -u'

# Windows

Add-Alias poshadm 'Start-Process powershell -verb runas'
Add-Alias s 'start'

# Unix 

Add-Alias c 'clear'
Add-Alias l 'ls'
Add-Alias ll 'ls -Force'

# SQLLocalDB

Add-Alias sld 'SqlLocalDB'
Add-Alias sldi 'SqlLocalDB i' # info
Add-Alias sldp 'SqlLocalDB p' # stop
Add-Alias slds 'SqlLocalDB s' # start
Add-Alias sldv 'SqlLocalDB v' # versions

# Docker

Add-Alias dk 'docker'
Add-Alias dkc 'docker-compose'
Add-Alias dkcsta 'docker-compose start'
Add-Alias dkcstp 'docker-compose stop'
