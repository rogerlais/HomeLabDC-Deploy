# Define o URL de download
$url = "https://github.com/git-for-windows/git/releases/latest/download/Git-64-bit.exe"

# Define o caminho do arquivo de saída
$output = "$env:TEMP\git-installer.exe"

# Baixa o instalador
Invoke-WebRequest -Uri $url -OutFile $output

# Executa o instalador
#Start-Process -FilePath $output -Args "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /NOICONS /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\"" -Wait -PassThru
Start-Process -FilePath $output -Args "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\"" -Wait -PassThru
