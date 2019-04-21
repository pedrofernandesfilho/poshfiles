#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    # user
    $user = [System.Environment]::UserName
    if (Test-NotDefaultUser($user)) {
      #$prompt = Set-NewLine

      $prompt += Write-Prompt -Object $user -ForegroundColor $sl.Colors.PromptHighlightColor
      # devicename
      $device = Get-ComputerName
      $prompt += Write-Prompt -Object " @ $device" -ForegroundColor $sl.Colors.PromptHighlightColor
      # date time
      $dateTime = Get-Date -Format G
      $prompt += Write-Prompt " [$dateTime]" -ForegroundColor $sl.Colors.PromptForegroundColor
    }

    $prompt += Set-NewLine

    # folder
    $dir = Get-FullPath -dir $pwd
    $prompt += Write-Prompt -Object $dir -ForegroundColor $sl.Colors.PromptForegroundColor

    # git status
    $gitStatus = Get-VCSStatus
    if ($gitStatus) {
        $themeInfo = Get-VcsInfo -status ($gitStatus)
        $prompt += Write-Prompt -Object " [$($themeInfo.VcInfo)]" -ForegroundColor $themeInfo.BackgroundColor
    }

    $prompt += Set-NewLine

    # last command state
    $foregroundColor = $sl.Colors.PromptHighlightColor
    If ($lastCommandFailed) {
        $foregroundColor = $sl.Colors.CommandFailedIconForegroundColor
    }

    # promt indicator
    $promptIndicator = $sl.PromptSymbols.PromptIndicator
    If (Test-Administrator) {
        $promptIndicator = $sl.PromptSymbols.ElevatedSymbol
    }

    $prompt += Write-Prompt -Object "$promptIndicator " -ForegroundColor $foregroundColor

    $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.GitSymbols.BranchSymbol = ''
$sl.GitSymbols.BranchIdenticalStatusToSymbol = $GitPromptSettings.BranchIdenticalStatusSymbol.Text
