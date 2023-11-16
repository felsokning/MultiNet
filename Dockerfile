FROM scratch as builder
ADD alpine-minirootfs-3.18.4-x86_64.tar.gz /

ARG DotNetSdkVersion=8.0
ARG PowerShell_Version=7.3.6

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV POWERSHELL_TELEMETRY_OPTOUT=1

RUN apk -U upgrade \
    && apk add --upgrade --no-cache apk-tools \
    && apk upgrade --available --no-cache \
    && apk add --no-cache aspnetcore6-runtime aspnetcore7-runtime bash ca-certificates cargo curl dotnet6-runtime \
        dotnet6-sdk dotnet7-runtime dotnet7-sdk gcc groff icu-libs krb5-libs less libffi-dev libgcc \
        libgdiplus libintl libssl1.1 libstdc++ make musl-dev nano ncurses-terminfo-base openssl-dev tzdata userspace-rcu wget zlib \
    && apk add --update --no-cache tar \
    # Install .NET Core 2.1 ASP.NET Runtime
    && wget -O aspnetcore-runtime-2.1.30-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/12ab23c7-2178-44d6-95e8-edf01092591f/e0f3b4e0ab258cf8e10f425200422247/aspnetcore-runtime-2.1.30-linux-musl-x64.tar.gz \
    && tar zxf aspnetcore-runtime-2.1.30-linux-musl-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-2.1.30-linux-musl-x64.tar.gz \
    && mv aspnetcore-runtime-2.1.30-linux-musl-x64/shared/Microsoft.AspNetCore.App/2.1.30/ /usr/lib/dotnet/shared/Microsoft.AspNetCore.App \
    && rm -rf aspnetcore-runtime-2.1.30-linux-musl-x64 \
    # Install .NET Core 2.1 Runtime
    && wget -O dotnet-runtime-2.1.30-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/89b06bc9-b42d-4bc4-9685-6402e4d05081/77915213f48da1b4ecfd8b94c6f30a95/dotnet-runtime-2.1.30-linux-musl-x64.tar.gz \
    && tar zxf dotnet-runtime-2.1.30-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-2.1.30-linux-musl-x64.tar.gz \
    && mv dotnet-runtime-2.1.30-linux-musl-x64/shared/Microsoft.NETCore.App/2.1.30/ /usr/lib/dotnet/shared/Microsoft.NETCore.App \
    && rm -rf dotnet-runtime-2.1.30-linux-musl-x64 \
    # Install .NET Core 2.1 SDK
    && wget -O dotnet-sdk-2.1.818-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/f1c2c969-8be9-458b-b34f-21df996f6114/a08a398cb7a9a42d23de2eeaef72e5e3/dotnet-sdk-2.1.818-linux-musl-x64.tar.gz \
    && tar zxf dotnet-sdk-2.1.818-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-2.1.818-linux-musl-x64.tar.gz \
    && mv dotnet-sdk-2.1.818-linux-musl-x64/sdk/2.1.818/ /usr/lib/dotnet/sdk \
    && rm -rf dotnet-sdk-2.1.818-linux-musl-x64 \
    # Install .NET Core 2.2 ASP.NET Runtime
    && wget -O aspnetcore-runtime-2.2.8-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/981063ac-98de-4622-9da7-c9df5a2547b5/ebc5edcac0759ad87f478c92f36a9a0c/aspnetcore-runtime-2.2.8-linux-musl-x64.tar.gz \
    && tar zxf aspnetcore-runtime-2.2.8-linux-musl-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-2.2.8-linux-musl-x64.tar.gz \
    && mv aspnetcore-runtime-2.2.8-linux-musl-x64/shared/Microsoft.AspNetCore.App/2.2.8/ /usr/lib/dotnet/shared/Microsoft.AspNetCore.App \
    && rm -rf aspnetcore-runtime-2.2.8-linux-musl-x64 \
    # Install .NET Core 2.2 Runtime
    && wget -O dotnet-runtime-2.2.8-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/f5e25e07-9934-4323-9f8b-164e2a829063/d95bd8e5f1dd52168ebf4fb9594507b1/dotnet-runtime-2.2.8-linux-musl-x64.tar.gz \
    && tar zxf dotnet-runtime-2.2.8-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-2.2.8-linux-musl-x64.tar.gz \
    && mv dotnet-runtime-2.2.8-linux-musl-x64/shared/Microsoft.NETCore.App/2.2.8/ /usr/lib/dotnet/shared/Microsoft.NETCore.App \
    && rm -rf dotnet-runtime-2.2.8-linux-musl-x64 \
    # Install .NET Core 2.2 SDK
    && wget -O dotnet-sdk-2.2.207-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/c72122bd-38f5-4c98-b585-b8aaf57ecc6e/c89d7774a430e163d801753654f33972/dotnet-sdk-2.2.207-linux-musl-x64.tar.gz \
    && tar zxf dotnet-sdk-2.2.207-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-2.2.207-linux-musl-x64.tar.gz \
    && mv dotnet-sdk-2.2.207-linux-musl-x64/sdk/2.2.207/ /usr/lib/dotnet/sdk \
    && rm -rf dotnet-sdk-2.2.207-linux-musl-x64 \
    # Install .NET Core 3.0 ASP.NET Runtime
    && wget -O aspnetcore-runtime-3.0.3-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/baa7233f-cbd9-486e-bcfd-9c4bd6142d31/c77859cee6f8ddba26b8af1ca1694771/aspnetcore-runtime-3.0.3-linux-musl-x64.tar.gz \
    && tar zxf aspnetcore-runtime-3.0.3-linux-musl-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-3.0.3-linux-musl-x64.tar.gz \
    && mv aspnetcore-runtime-3.0.3-linux-musl-x64/shared/Microsoft.AspNetCore.App/3.0.3/ /usr/lib/dotnet/shared/Microsoft.AspNetCore.App \
    && rm -rf aspnetcore-runtime-3.0.3-linux-musl-x64 \
    # Install .NET Core 3.0 Runtime
    && wget -O dotnet-runtime-3.0.3-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/0c3dbb86-d643-489b-b1a7-d3c386d8fa47/fc9e71cbcca384c03a37e8b5aa9d07be/dotnet-runtime-3.0.3-linux-musl-x64.tar.gz \
    && tar zxf dotnet-runtime-3.0.3-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-3.0.3-linux-musl-x64.tar.gz \
    && mv dotnet-runtime-3.0.3-linux-musl-x64/shared/Microsoft.NETCore.App/3.0.3/ /usr/lib/dotnet/shared/Microsoft.NETCore.App \
    && rm -rf dotnet-runtime-3.0.3-linux-musl-x64 \
    # Install .NET Core 3.0 SDK
    && wget -O dotnet-sdk-3.0.103-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/66a28bc9-f5c1-454b-b729-986b7c7040be/72285e6d6e74780c63cc061503a2d88a/dotnet-sdk-3.0.103-linux-musl-x64.tar.gz \
    && tar zxf dotnet-sdk-3.0.103-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-3.0.103-linux-musl-x64.tar.gz \
    && mv dotnet-sdk-3.0.103-linux-musl-x64/sdk/3.0.103/ /usr/lib/dotnet/sdk \
    && rm -rf dotnet-sdk-3.0.103-linux-musl-x64 \
    # Install .NET Core 3.1 ASP.NET Runtime
    && wget -O aspnetcore-runtime-3.1.32-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/e94c26b7-6ac0-46b9-81f1-e008ce8348cb/41d57ffacf3e151de8039ec3cd007a68/aspnetcore-runtime-3.1.32-linux-musl-x64.tar.gz \
    && tar zxf aspnetcore-runtime-3.1.32-linux-musl-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-3.1.32-linux-musl-x64.tar.gz \
    && mv aspnetcore-runtime-3.1.32-linux-musl-x64/shared/Microsoft.AspNetCore.App/3.1.32/ /usr/lib/dotnet/shared/Microsoft.AspNetCore.App \
    && rm -rf aspnetcore-runtime-3.1.32-linux-musl-x64 \
    # Install .NET Core 3.1 Runtime
    && wget -O dotnet-runtime-3.1.32-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/62feabe5-70ce-4d6b-8b50-a0f6914b86cc/f9aa8a11f0311a5af16035ba94e34737/dotnet-runtime-3.1.32-linux-musl-x64.tar.gz \
    && tar zxf dotnet-runtime-3.1.32-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-3.1.32-linux-musl-x64.tar.gz \
    && mv dotnet-runtime-3.1.32-linux-musl-x64/shared/Microsoft.NETCore.App/3.1.32/ /usr/lib/dotnet/shared/Microsoft.NETCore.App \
    && rm -rf dotnet-runtime-3.1.32-linux-musl-x64 \
    # Install .NET Core 3.1 SDK
    && wget -O dotnet-sdk-3.1.426-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/f8834fef-d2ab-4cf6-abc3-d8d79cfcde11/0ee05ef4af5fe324ce2977021bf9f340/dotnet-sdk-3.1.426-linux-musl-x64.tar.gz \
    && tar zxf dotnet-sdk-3.1.426-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-3.1.426-linux-musl-x64.tar.gz \
    && mv dotnet-sdk-3.1.426-linux-musl-x64/sdk/3.1.426/ /usr/lib/dotnet/sdk \
    && rm -rf dotnet-sdk-3.1.426-linux-musl-x64 \
    # Install .NET 5.0 ASP.NET Runtime
    && wget -O aspnetcore-runtime-5.0.17-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/3ab34ea5-4c97-4fa1-8d36-c077b3e57cdc/d4caf10e195b3e5fe1a1879005685ee8/aspnetcore-runtime-5.0.17-linux-musl-x64.tar.gz \
    && tar zxf aspnetcore-runtime-5.0.17-linux-musl-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-5.0.17-linux-musl-x64.tar.gz \
    && mv aspnetcore-runtime-5.0.17-linux-musl-x64/shared/Microsoft.AspNetCore.App/5.0.17/ /usr/lib/dotnet/shared/Microsoft.AspNetCore.App \
    && rm -rf aspnetcore-runtime-5.0.17-linux-musl-x64 \
    # Install .NET 5.0 Runtime
    && wget -O dotnet-runtime-5.0.17-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/ca2c996c-0de8-475c-a825-06e50947315f/dd638d00b482dde611149913befec583/dotnet-runtime-5.0.17-linux-musl-x64.tar.gz \
    && tar zxf dotnet-runtime-5.0.17-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-5.0.17-linux-musl-x64.tar.gz \
    && mv dotnet-runtime-5.0.17-linux-musl-x64/shared/Microsoft.NETCore.App/5.0.17/ /usr/lib/dotnet/shared/Microsoft.NETCore.App \
    && rm -rf dotnet-runtime-5.0.17-linux-musl-x64 \
    # Install .NET 5.0 SDK
    && wget -O dotnet-sdk-5.0.408-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/a88aeea9-218f-493d-8055-a56d019f0834/a27cca834652c142855d34e11a1e524b/dotnet-sdk-5.0.408-linux-musl-x64.tar.gz \
    && tar zxf dotnet-sdk-5.0.408-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-5.0.408-linux-musl-x64.tar.gz \
    && mv dotnet-sdk-5.0.408-linux-musl-x64/sdk/5.0.408/ /usr/lib/dotnet/sdk \
    && rm -rf dotnet-sdk-5.0.408-linux-musl-x64 \
    # Install .NET 8.0 ASP.NET Runtime
    && wget -O aspnetcore-runtime-8.0.0-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/7aa33fc7-07fe-48c2-8e44-a4bfb4928535/3b96ec50970eee414895ef3a5b188bcd/aspnetcore-runtime-8.0.0-linux-musl-x64.tar.gz \
    && tar zxf aspnetcore-runtime-8.0.0-linux-musl-x64.tar.gz --one-top-level \
    && rm -f aspnetcore-runtime-8.0.0-linux-musl-x64.tar.gz \
    && mv aspnetcore-runtime-8.0.0-linux-musl-x64/shared/Microsoft.AspNetCore.App/8.0.0/ /usr/lib/dotnet/shared/Microsoft.AspNetCore.App \
    && rm -rf aspnetcore-runtime-8.0.0-linux-musl-x64 \
    # Install .NET 8.0 Runtime
    && wget -O dotnet-runtime-8.0.0-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/731765c8-5774-414d-8157-bf184806bca9/7a3c7add7562e1be15954a2739fefe30/dotnet-runtime-8.0.0-linux-musl-x64.tar.gz \
    && tar zxf dotnet-runtime-8.0.0-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-runtime-8.0.0-linux-musl-x64.tar.gz \
    && mv dotnet-runtime-8.0.0-linux-musl-x64/shared/Microsoft.NETCore.App/8.0.0/ /usr/lib/dotnet/shared/Microsoft.NETCore.App \
    && rm -rf dotnet-runtime-8.0.0-linux-musl-x64 \
    # Install .NET 8.0 SDK
    && wget -O dotnet-sdk-8.0.100-linux-musl-x64.tar.gz https://download.visualstudio.microsoft.com/download/pr/40a3227f-0d20-4c23-b1a5-ecd659e3faef/fa59541ab3a35a50172ea5f81070e075/dotnet-sdk-8.0.100-linux-musl-x64.tar.gz \
    && tar zxf dotnet-sdk-8.0.100-linux-musl-x64.tar.gz --one-top-level \
    && rm -f dotnet-sdk-8.0.100-linux-musl-x64.tar.gz \
    && mv dotnet-sdk-8.0.100-linux-musl-x64/sdk/8.0.100/ /usr/lib/dotnet/sdk \
    && rm -rf dotnet-sdk-8.0.100-linux-musl-x64 \
    # Set the Default .NET SDK Version (The Current LTS)
    && dotnet new globaljson --sdk-version=${DotNetSdkVersion} \
    # Install PowerShell
    && apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache lttng-ust \
    && wget -O /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v${PowerShell_Version}/powershell-${PowerShell_Version}-linux-alpine-x64.tar.gz \
    && mkdir -p /opt/microsoft/powershell/7 \
    && tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7 \
    && chmod +x /opt/microsoft/powershell/7/pwsh \
    && ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh \
    # Install .NET Tools
    && dotnet tool install --global dotnet-counters \
    && dotnet tool install --global dotnet-coverage \
    && dotnet tool install --global dotnet-dump \
    && dotnet tool install --global dotnet-gcdump \
    && dotnet tool install --global dotnet-trace \
    && dotnet tool install --global dotnet-sos \
    && dotnet tool install --global dotnet-stack

FROM scratch as finalizer
COPY --from=builder / /

CMD [ "/bin/bash" ]