#All filenames in current directory without extension
(Get-ChildItem).BaseName

#New directories by names from local ndirs.txt
#Get-Content .\ndirs.txt | ForEach {mkdir $_}
New-Item -Path (Get-Content .\ndirs.txt) -ItemType directory
