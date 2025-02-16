# Script para desinstalar todas as versões do 7-Zip e instalar a versão mais recente

# Variável para o caminho do instalador do 7-Zip
$zipInstallerPath = "7z2409-x64.exe"
$ScriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

# Função para desinstalar 7-Zip MSI
function Uninstall-7Zip-Msi {
    $7ZipProducts = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "7-Zip" }
    foreach ($product in $7ZipProducts) {
        $product.Uninstall()
    }
}

#Função para desinstalar o 7-Zip EXE
function Uninstall-7Zip-Exe {
    Start-Process -FilePath "%ProgramFiles%\7-Zip\Uninstall.exe" -ArgumentList "/S" -Wait
}

# Função para instalar a versão mais recente do 7-Zip
function Install-7Zip {
    Start-Process -FilePath "$ScriptPath\$zipInstallerPath" -ArgumentList "/S" -Wait
}

# Desinstalar todas as versões do 7-Zip Msi
Uninstall-7Zip-Msi

# Desinstalar todas as versões do 7-Zip Exe
Uninstall-7Zip-Msi

# Instalar a versão mais recente do 7-Zip Exe
Install-7Zip