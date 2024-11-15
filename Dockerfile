FROM ubuntu:22.04

ENV PATH=$PATH:/root/.dotnet

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get install ca-certificates libc6 libgcc-s1 libgssapi-krb5-2 libicu70 liblttng-ust1 libssl3 libstdc++6 libunwind8 tzdata wget zlib1g -y \
    && wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x ./dotnet-install.sh \
    && ./dotnet-install.sh --channel 9.0 \
    && ./dotnet-install.sh --channel 8.0 \
    && ./dotnet-install.sh --channel 7.0 \
    && ./dotnet-install.sh --channel 6.0 \
    && ./dotnet-install.sh --channel 5.0 \
    && ./dotnet-install.sh --channel 3.1 \
    && ./dotnet-install.sh --channel 3.0 \
    && apt-get remove wget -y 