#Detect File : Detect-file.ps1
$FileName = "FileToDesktop.pdf"
if (Test-Path -Path "$Env:Public\Desktop\$FileName"){
    Write-Output "0"
}