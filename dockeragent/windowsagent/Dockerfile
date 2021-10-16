FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR /azp

# install nuget, required for the following command to add PowerShell Az module
RUN powershell Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# install Az module
RUN powershell Install-Module -Name Az -AllowClobber -Force

# install azure cli
RUN powershell Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

# optional
# Installing Chocolatey Nuget and jq
RUN powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install jq -y

COPY start.ps1 .

CMD powershell .\start.ps1