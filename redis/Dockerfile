# # FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
# FROM mcr.microsoft.com/windows/servercore:ltsc2019
# # FROM mcr.microsoft.com/windows/servercore/iis
# # # FROM alexellisio/redis-windows:3.2
# SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"] ;
# RUN Invoke-Webrequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression;
# RUN "C:\ProgramData\chocolatey\choco install -y redis-64";

# # COPY ./redis/redis.conf C:/
# EXPOSE 6379/tcp
# ENTRYPOINT [ "C:\ProgramData\chocolatey\lib\redis-64\redis-server.exe" ]   
# LABEL Description=Redis Vendor=MSOpenTech Version=3.2
# ENV maxmemory=500MB

# # WORKDIR C:\redis
# RUN Invoke-WebRequest -Method Get -Uri https://github.com/MSOpenTech/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.zip -OutFile redis.zip ;\
# Expand-Archive redis.zip . ; \
# Remove-Item redis.zip -Force;
# EXPOSE 6379/tcp
# CMD [ "redis-server", "c:\redis.conf" ] 



FROM mcr.microsoft.com/windows/nanoserver:1809
# SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"] ;
LABEL Description="Redis" Vendor="MSOpenTech" Version="3.2"

ENV maxmemory=500MB
ENV protected-mode=yes

EXPOSE 6379

#WORKDIR /redis
COPY redis/redis c:/
# RUN ls -l c:/ ;
CMD redis-server --maxmemory %maxmemory% --protected-mode %protected-mode%
