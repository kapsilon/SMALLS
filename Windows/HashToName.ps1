# Rename-Item Get-ChildItem ((Get-FileHash -Path (Get-ChildItem) -Algorithm SHA512).Hash)

# (Get-FileHash -Path (Get-ChildItem) -Algorithm SHA512).Hash

#Rename-Item -Path (Get-ChildItem.Name)   -NewName 123 

#Get-ChildItem | Rename-Item -NewName 123

#(Out-String -InputObject (Get-FileHash -Path (Get-ChildItem) -Algorithm SHA512).Hash)

#Get-ChildItem | Rename-Item -NewName {Out-String -InputObject (Get-FileHash -Path (Get-ChildItem) -Algorithm SHA384).Hash)}

#Rename-Item -Path "Batman (2016-) 004-011.jpg" -NewName (Get-FileHash -Path ("Batman (2016-) 004-011.jpg") -Algorithm SHA512).Hash

#(Get-ChildItem).Name


function Rename-FilesToSHA {
    [CmdletBinding()]
    Param(
    [ValidateScript({ Test-Path $_ })]
    $Path
    )

    $hasher = [System.Security.Cryptography.HashAlgorithm]::Create('SHA384')
    $files = Get-ChildItem $Path -Recurse | Where-Object {-not $_.PSIsContainer}

    foreach ($file in $files) {

    $fs = New-Object IO.FileStream($file.FullName, 'Open')
    $sb = New-Object System.Text.StringBuilder

    $hasher.ComputeHash($fs) | ForEach-Object { [void]$sb.Append($_.ToString("x2")) }
    $fs.Close()
  
    $file | Rename-Item -NewName $sb.ToString()
    }
}

Set-Location K:\cLIB\Hashing
Rename-FilesToSHA -Path ./