FROM ubuntu:18.04

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        netcat \
        liblttng-ust0 \
        libssl1.0.0 \
        wget \
        zip \
        unzip \
        software-properties-common

# # Download the Microsoft repository GPG keys
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

# # Register the Microsoft repository GPG keys
RUN dpkg -i packages-microsoft-prod.deb

# # Update the list of products
RUN apt-get update

# # Enable the "universe" repositories
RUN add-apt-repository universe

# install Azure Cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]