# PowerShell Profile Installation
#Copy-Item "PowerShell Profile.ps1" -Destination "${home}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"




# All filenames in current directory without extension
Function Basenames-OfFiles-InCurrentDirectory {
    (Get-ChildItem).BaseName
}
Set-Alias names -Value Basenames-OfFiles-InCurrentDirectory

# New directories by names from clipboard
Function NewDirectories-ByNames-InClipboard {
    $newDirs = Get-Clipboard -Format Text -TextFormatType Text
    echo $newDirs
    New-Item -Path ($newDirs) -ItemType directory -Confirm
}
Set-Alias newdirs -Value NewDirectories-ByNames-InClipboard

# Find matching string in file
Function Find-NotUniqueStrings-InFile($file) {
    $results =
    Get-Content $file |
    Group -NoElement |
    Where { $_.Name -NotLike "" -and $_.Count -NotMatch 1 } |
    Format-Table -Property Name -AutoSize -HideTableHeaders

    if ($results) { echo $results }
    else { echo OK }
}
Set-Alias uniqs -Value Find-NotUniqueStrings-InFile

# Get full path of symbolic link
Function Get-Full-Path-of-Symbol-Link($path) {
    Get-Item $path | Select-Object -ExpandProperty Target
}
Set-Alias linkpath -Value Get-Full-Path-of-Symbol-Link

# PowerShell Prompt with colors
$ESC = [char]27
Function Prompt {
    "$ESC[30;104m$env:USERNAME@$env:COMPUTERNAME$ESC[30;47m $(Get-Location) $ESC[30;102m$('PS' * ($nestedPromptLevel + 1))$ESC[0m "
}

Set-PSReadLineOption -Colors @{
    Command   = 'DarkBlue'
    Operator  = 'DarkYellow'
    Parameter = 'DarkYellow'
    String    = 'White'
}

# All Clear
Clear-Host
Set-Location /
