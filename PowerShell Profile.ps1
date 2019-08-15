# PowerShell Profile is placed in
#C:\Users\...\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Docker
Function Docker-Simple-Control($command) {
    $host.UI.RawUI.WindowTitle = "$command (Docker) | ${pwd}"
    Switch ($command) {
        start {
            docker pull alpine/git
            docker pull bash
            docker pull cirrusci/flutter
            docker pull elasticsearch
            docker pull gogs/gogs
            docker pull haskell
            docker pull libreoffice/online
            docker pull mariadb
            docker pull mathematica12/mathematica12
            docker pull node
            docker pull postgres
            docker pull python
            docker pull tensorflow/tensorflow
            docker pull wordpress
        }
        update {
            docker images --format "{{.Repository}}:{{.Tag}}" | ForEach-Object { docker pull "$_" }
        }
        conts{
            docker ps
        }
        contsrm{
            docker rm $(docker ps -a -q)
        }
        images{
            docker images
        }
        imagesrm{
            docker rmi $(docker images -q)
        }
        git { #not interactive(((
            docker run -it --rm `
            --name git `
            -v ${pwd}:/project `
            -w /project `
            alpine/git `
            /bin/bash
        }
        go {
            docker run -it --rm `
                --name go `
                -e GOARCH=amd64 `
                -e GOOS=windows `
                -e GOPATH=/gopath `
                -v ${home}/_GOPATH:/gopath `
                -v ${pwd}:/project `
                -w /project `
                golang:latest `
                /bin/bash
        }
        python {
            docker run -it --rm `
                --name python `
                -v ${home}/_PYPATH:/usr/local/lib/python3.7/site-packages `
                -v ${pwd}:/project `
                -w /project `
                python:latest `
                /bin/bash
        }
        default {
            echo "Administration"
            echo "  start, update, conts, contsrm, images, imagesrm"
            echo "Languages"
            echo "  go, python"
        }
    }
    $host.UI.RawUI.WindowTitle = "PowerShell"
}
Set-Alias dock -Value Docker-Simple-Control

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
      Group -NoElement  |
      Where {$_.Name -NotLike "" -and $_.Count-NotMatch 1} |
      Format-Table -Property Name -AutoSize -HideTableHeaders

    if ($results) {echo $results}
    else {echo OK}
}
Set-Alias uniqs -Value Find-NotUniqueStrings-InFile


# PowerShell Prompt with colors
$ESC = [char]27
Function Prompt {
    "$ESC[30;104m$env:USERNAME@$env:COMPUTERNAME$ESC[30;47m $(Get-Location) $ESC[30;102m$('PS' * ($nestedPromptLevel + 1))$ESC[0m "
}

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

# All Clear
Clear-Host
cd /
