FROM debian:11.7-slim

# Settable .NET SDK Targeting to Current LTS
ARG DotNetSdkVersion=6.0

COPY 99-microsoft /etc/apt/preferences.d/
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="$PATH:/root/.dotnet/tools"
ENV POWERSHELL_TELEMETRY_OPTOUT=true
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true

RUN apt-get update \
    && apt-get install wget gnupg ca-certificates apt-transport-https -y \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && wget -q https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm -f packages-microsoft-prod.deb \
    && apt-get update \
    # Install .NET6.0, .NET7.0, & PowerShell
    && apt-get install dotnet-runtime-6.0 aspnetcore-runtime-6.0 dotnet-sdk-6.0 dotnet-runtime-7.0 aspnetcore-runtime-7.0 dotnet-sdk-7.0 powershell=7.3.4-1.deb -y \
    # Set the Default .NET SDK Version (The Current LTS)
    && dotnet new globaljson --sdk-version=${DotNetSdkVersion} \
    # Install .NET Core 3.0
    && wget -O dotnet-runtime-3.0.3-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/6ad304ea-28a3-41c6-b30f-f0e1393f41de/83af63265fd59a8bf171417bd5134bb6/dotnet-runtime-3.0.3-linux-x64.tar.gz \
    && tar -xvf dotnet-runtime-3.0.3-linux-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-3.0.3-linux-x64.tar.gz \
    && mv dotnet-runtime-3.0.3-linux-x64/shared/Microsoft.NETCore.App/3.0.3 /usr/share/dotnet/shared/Microsoft.NETCore.App/ \
    && rm -rf dotnet-runtime-3.0.3-linux-x64 \
    && wget -O aspnetcore-runtime-3.0.3-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/c25ded8c-70c9-4287-9d25-f7842bca6b93/d03d7e7206c6d98240fd0696054468d0/aspnetcore-runtime-3.0.3-linux-x64.tar.gz \
    && tar -xvf aspnetcore-runtime-3.0.3-linux-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-3.0.3-linux-x64.tar.gz \
    && mv aspnetcore-runtime-3.0.3-linux-x64/shared/Microsoft.AspNetCore.App/3.0.3 /usr/share/dotnet/shared/Microsoft.AspNetCore.App/ \
    && rm -rf aspnetcore-runtime-3.0.3-linux-x64 \
    && wget -O dotnet-sdk-3.0.103-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/43f3a3bd-3df2-41e6-beca-3ec4952ca6c4/30fe7779249607d1bb3bb4b20d61a479/dotnet-sdk-3.0.103-linux-x64.tar.gz \
    && tar -xvf dotnet-sdk-3.0.103-linux-x64.tar.gz --one-top-level \
    && mv dotnet-sdk-3.0.103-linux-x64/sdk/3.0.103 /usr/share/dotnet/sdk \
    && rm -rf dotnet-sdk-3.0.103-linux-x64 \
    # Install .NET Core 3.1
    && wget -O dotnet-runtime-3.1.32-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/fea239ad-fd47-4764-aa71-6a147a82f632/20ee58b0bf08ae9f6e76e37ba3765c57/dotnet-runtime-3.1.32-linux-x64.tar.gz \
    && tar -xvf dotnet-runtime-3.1.32-linux-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-3.1.32-linux-x64.tar.gz \
    && mv dotnet-runtime-3.1.32-linux-x64/shared/Microsoft.NETCore.App/3.1.32 /usr/share/dotnet/shared/Microsoft.NETCore.App/ \
    && rm -rf dotnet-runtime-3.1.32-linux-x64 \
    && wget -O aspnetcore-runtime-3.1.32-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/39c3ef4c-73c7-4248-8c54-0865d5feb8b2/3420b1ff6b0f36e63044d6f7a794b579/aspnetcore-runtime-3.1.32-linux-x64.tar.gz \
    && tar -xvf aspnetcore-runtime-3.1.32-linux-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-3.1.32-linux-x64.tar.gz \
    && mv aspnetcore-runtime-3.1.32-linux-x64/shared/Microsoft.AspNetCore.App/3.1.32 /usr/share/dotnet/shared/Microsoft.AspNetCore.App/ \
    && rm -rf aspnetcore-runtime-3.1.32-linux-x64 \
    && wget -O dotnet-sdk-3.1.426-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/e89c4f00-5cbb-4810-897d-f5300165ee60/027ace0fdcfb834ae0a13469f0b1a4c8/dotnet-sdk-3.1.426-linux-x64.tar.gz \
    && tar -xvf dotnet-sdk-3.1.426-linux-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-3.1.426-linux-x64.tar.gz \
    && mv dotnet-sdk-3.1.426-linux-x64/sdk/3.1.426 /usr/share/dotnet/sdk \
    && rm -rf dotnet-sdk-3.1.426-linux-x64 \
    # Install .NET5.0
    && wget -O dotnet-sdk-5.0.408-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/904da7d0-ff02-49db-bd6b-5ea615cbdfc5/966690e36643662dcc65e3ca2423041e/dotnet-sdk-5.0.408-linux-x64.tar.gz \
    && tar -xvf dotnet-sdk-5.0.408-linux-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-5.0.408-linux-x64.tar.gz \
    && mv dotnet-sdk-5.0.408-linux-x64/sdk/5.0.408 /usr/share/dotnet/sdk \
    && rm -rf dotnet-sdk-5.0.408-linux-x64 \
    && wget -O aspnetcore-runtime-5.0.17-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/a2b96f83-e22a-4fa6-a10e-709b3effac9a/0d6ade6c0ceebc8ef7dbf2b1a6d86f17/aspnetcore-runtime-5.0.17-linux-x64.tar.gz \
    && tar -xvf aspnetcore-runtime-5.0.17-linux-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-5.0.17-linux-x64.tar.gz \
    && mv aspnetcore-runtime-5.0.17-linux-x64/shared/Microsoft.AspNetCore.App/5.0.17 /usr/share/dotnet/shared/Microsoft.AspNetCore.App/ \
    && mv aspnetcore-runtime-5.0.17-linux-x64/shared/Microsoft.NETCore.App/5.0.17 /usr/share/dotnet/shared/Microsoft.NETCore.App/ \
    && rm -rf aspnetcore-runtime-5.0.17-linux-x64 \
    # Install .NET8.0 (Preview)
    && wget -O dotnet-runtime-8.0.0-preview.4.23259.5-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/7267fec0-ae12-4f40-9c3d-56da5fbf83e4/f64c2758980c1f908cbe089a6233bbe7/dotnet-runtime-8.0.0-preview.4.23259.5-linux-x64.tar.gz \
    && tar -xvf dotnet-runtime-8.0.0-preview.4.23259.5-linux-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-8.0.0-preview.4.23259.5-linux-x64.tar.gz \
    && mv dotnet-runtime-8.0.0-preview.4.23259.5-linux-x64/shared/Microsoft.NETCore.App/8.0.0-preview.4.23259.5 /usr/share/dotnet/shared/Microsoft.NETCore.App/ \
    && rm -rf dotnet-runtime-8.0.0-preview.4.23259.5-linux-x64 \
    && wget -O aspnetcore-runtime-8.0.0-preview.4.23260.4-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/bda9e867-46d3-416b-864f-5fb28658a8fd/c58375f59b0c0a9946a2be04617a7276/aspnetcore-runtime-8.0.0-preview.4.23260.4-linux-x64.tar.gz \
    && tar -xvf aspnetcore-runtime-8.0.0-preview.4.23260.4-linux-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-8.0.0-preview.4.23260.4-linux-x64.tar.gz \
    && mv aspnetcore-runtime-8.0.0-preview.4.23260.4-linux-x64/shared/Microsoft.AspNetCore.App/8.0.0-preview.4.23260.4 /usr/share/dotnet/shared/Microsoft.AspNetCore.App/ \
    && rm -rf aspnetcore-runtime-8.0.0-preview.4.23260.4-linux-x64 \
    && wget -O dotnet-sdk-8.0.100-preview.4.23260.5-linux-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/ae0534ab-1c49-4055-ba2a-b8159c4f94d2/3a5945c949d2eb141f8ce52096fca13c/dotnet-sdk-8.0.100-preview.4.23260.5-linux-x64.tar.gz \
    && tar -xvf dotnet-sdk-8.0.100-preview.4.23260.5-linux-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-8.0.100-preview.4.23260.5-linux-x64.tar.gz \
    && mv dotnet-sdk-8.0.100-preview.4.23260.5-linux-x64/sdk/8.0.100-preview.4.23260.5 /usr/share/dotnet/sdk \
    && rm -rf dotnet-sdk-8.0.100-preview.4.23260.5-linux-x64 \
    # Install .NET Tools
    && dotnet tool install --global dotnet-counters \
    && dotnet tool install --global dotnet-coverage \
    && dotnet tool install --global dotnet-dump \
    && dotnet tool install --global dotnet-gcdump \
    && dotnet tool install --global dotnet-trace \
    && dotnet tool install --global dotnet-sos \
    && dotnet tool install --global dotnet-stack \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove \
    && apt-get clean