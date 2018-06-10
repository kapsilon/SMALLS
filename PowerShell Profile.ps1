# PowerShell Profile is placed in
#C:\Users\...\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1


# All filenames in current directory without extension
function Basenames-OfFiles-InCurrentDirectory {
      (Get-ChildItem).BaseName
}
Set-Alias -Name names -Value Basenames-OfFiles-InCurrentDirectory

# New directories by names from local ndirs.txt
#Get-Content .\ndirs.txt | ForEach {mkdir $_}
function NewDeirectories-ByNames-InLocalFile {
      New-Item -Path (Get-Content .\ndirs.txt) -ItemType directory
}
Set-Alias -Name ndirs -Value NewDeirectories-ByNames-InLocalFile

# Host Foreground & Background
$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.WarningForegroundColor = 'Yellow'
$Host.PrivateData.DebugForegroundColor = 'Green'
$Host.PrivateData.VerboseForegroundColor = 'Blue'
$Host.PrivateData.ProgressForegroundColor = 'Gray'
$Host.PrivateData.ErrorBackgroundColor = 'DarkGray'
$Host.PrivateData.WarningBackgroundColor = 'DarkGray'
$Host.PrivateData.DebugBackgroundColor = 'DarkGray'
$Host.PrivateData.VerboseBackgroundColor = 'DarkGray'
$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

# PSReadline
if (Get-Module -ListAvailable -Name "PSReadline") {
    $options = Get-PSReadlineOption
    $options.CommandForegroundColor = 'Yellow'
    $options.ContinuationPromptForegroundColor = 'DarkBlue'
    $options.DefaultTokenForegroundColor = 'DarkBlue'
    $options.EmphasisForegroundColor = 'Cyan'
    $options.ErrorForegroundColor = 'Red'
    $options.KeywordForegroundColor = 'Green'
    $options.MemberForegroundColor = 'DarkCyan'
    $options.NumberForegroundColor = 'DarkCyan'
    $options.OperatorForegroundColor = 'DarkGreen'
    $options.ParameterForegroundColor = 'DarkGreen'
    $options.StringForegroundColor = 'Blue'
    $options.TypeForegroundColor = 'DarkYellow'
    $options.VariableForegroundColor = 'Green'
    $options.CommandBackgroundColor = 'Black'
    $options.ContinuationPromptBackgroundColor = 'Black'
    $options.DefaultTokenBackgroundColor = 'Black'
    $options.EmphasisBackgroundColor = 'Black'
    $options.ErrorBackgroundColor = 'Black'
    $options.KeywordBackgroundColor = 'Black'
    $options.MemberBackgroundColor = 'Black'
    $options.NumberBackgroundColor = 'Black'
    $options.OperatorBackgroundColor = 'Black'
    $options.ParameterBackgroundColor = 'Black'
    $options.StringBackgroundColor = 'Black'
    $options.TypeBackgroundColor = 'Black'
    $options.VariableBackgroundColor = 'Black'
}
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadline
    Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function MenuComplete
}

# All Clear
clear
cd\
