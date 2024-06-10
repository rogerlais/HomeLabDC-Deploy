# Define o URL da API do GitHub
$url = 'https://api.github.com/repos/git-for-windows/git/releases/latest'

# Obtém os detalhes da versão mais recente
$latestRelease = Invoke-RestMethod -Uri $url

# Define o URL de download
$downloadUrl = $latestRelease.assets | Where-Object { $_.name -like '*64-bit.exe' } | Select-Object -First 1 -ExpandProperty browser_download_url

# Define o caminho do arquivo de saída
$output = "$env:TEMP\git-installer.exe"

# Baixa o instalador
Invoke-WebRequest -Uri $downloadUrl -OutFile $output
try {
	# Executa o instalador
	Start-Process -FilePath $output -Args "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS=`"icons,ext\reg\shellhere,assoc,assoc_sh`"" -Wait -PassThru
} catch {
	Write-Error "Erro ao instalar o Git: $_"
} finally {
	# Remove o instalador
	Remove-Item -Path $output -Force	
}
