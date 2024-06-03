
@echo off
rem encoding=iso 8859-1
chcp 1252

set REQ_VERSION=7.4.2

echo Testando a instalação do Powershell %REQ_VERSION% ou superior...

pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "& { Write-Host "Versão encontrada: $($PSVersionTable.PSVersion)"; if ( $($PSVersionTable.PSVersion) -ge $([Version]::New('%REQ_VERSION%')) ) { exit 0 } else { exit 1 } }" 2>nul
if %errorlevel% neq 0 (
	echo Powershell %REQ_VERSION%^ ou superior não encontrado.
	echo Fazendo instalação da versão mais recente do Powershell...

	rem using pre installed version of powershell to download and install the latest version
	call powershell.exe -NoLogo -NoProfile -NonInteractive -Command "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"
	if errorlevel 1 (
		echo Falha ao instalar Powershell(latest^).
		exit 1
	)else (
		echo Powershell instalado com sucesso!
	)
) else (
	echo Sucesso!
	echo Powershell %REQ_VERSION% ou superior encontrado.
	echo Nenhuma ação adicional necessária.
)
