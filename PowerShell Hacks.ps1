#All filenames in current directory without extension
(Get-ChildItem).Name -replace(".{4}$")
