# PowerShell Profile Installation
#Copy-Item "PowerShell Profile.ps1" -Destination "${home}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"


# Copying all folders and files
Function RoboCopy-All-Files($oldDirectory, $newDirectory) {
    robocopy  `
        $oldDirectory `
        $newDirectory `
        /E `
        /COPY:DAT `
        /DCOPY:DAT `
        /R:100 `
        /sl
}
Set-Alias copyall -Value RoboCopy-All-Files

# Create tree of files with zero length
Function RoboCopy-Zero-Tree($oldDirectory, $newDirectory) {
    robocopy  `
        $oldDirectory `
        $newDirectory `
        /CREATE `
        /MIR `
        /COPY:DAT `
        /DCOPY:DAT `
        /R:100
}

# Dowload video from YouTube or other video-hostings with youtube-dl+ffmpeg
Function Dowload-Video-From-YouTube ($link, $format) {
    #Set YouTube-DL
    $ytdlFolder = "C:\Program Files\YouTube-DL\"
    $ytdlExe = "youtube-dl.exe"
    $ytdl = $ytdlFolder + $ytdlExe
    #Set dowlnload
    $downloadFolder = "G:\Download\"
    $downloadFile = "%(title)s__%(resolution)s.%(ext)s"
    $dl = $downloadFolder + $downloadFile
 
    $host.UI.RawUI.WindowTitle = "YouTube-DL"
    if ($link -and $format) {
        if ($format -eq "1080") {
            $format = "-f 137+22"
        }
        elseif ($format -eq "subs") {
            $format = "--write-sub --convert-subs srt --sub-lang en,ru --skip-download"
        }
        elseif ($format -eq "asubs") {
            $format = "--write-auto-sub --sub-lang en,ru --skip-download"
        }
        else {
            $format = "-f " + $format
        }
        $arguments = $format + " -o " + $dl + " " + $link
        Start-Process -FilePath $ytdl -ArgumentList $arguments -NoNewWindow -Wait
    }
    elseif ($link) {
        $arguments = "-F " + $link
        Start-Process -FilePath $ytdl -ArgumentList $arguments -NoNewWindow -Wait
    }
    else {
        echo "For view all variants: 'youtube https://yourlink.to/video'"
        echo "For download variant (video+audio): 'youtube https://yourlink.to/video 137+22'"
        echo "For download 1080p+bestaudio: 'youtube https://yourlink.to/video 1080'"
        echo "For download subtitles: 'youtube https://yourlink.to/video subs'"
        echo "For download automated subtitles: 'youtube https://yourlink.to/video subs'"
    }
    $host.UI.RawUI.WindowTitle = "PowerShell"
}
Set-Alias youtube -Value Dowload-Video-From-YouTube

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

# Very simple diff of file trees
Function Compare-Difference-Of-Trees($old, $new, $diff) {
    if ($old -and $new -and $diff) {
        $treeold = tree $old
        $treenew = tree $new
        Compare-Object $treeold $treenew > $diff
    } else{
        echo "difftree path/to/dir1 path/to/dir2 path/to/difffile"
    }
}
Set-Alias difftree -Value Compare-Difference-Of-Trees

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

<#
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
#>

# All Clear
Clear-Host
cd /
