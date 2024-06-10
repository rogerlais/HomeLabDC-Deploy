# Define o URL de download
$url = 'https://aka.ms/win32-x64-user-stable'

# Define o caminho do arquivo de saída
$output = "$env:TEMP\vscode-installer.exe"

# Baixa o instalador
Invoke-WebRequest -Uri $url -OutFile $output
try {
	# Executa o instalador
	Start-Process -FilePath $output -Args '/silent /mergetasks=!runcode' -Wait -PassThru
} catch {
	Write-Error "Erro ao instalar o Visual Studio Code: $_"
}finally{
	# Remove o instalador
	Remove-Item -Path $output -Force
}
