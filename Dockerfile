FROM ubuntu:22.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list
RUN apt-get update && \
 apt-get install -y \
    software-properties-common \
    wget \
    ca-certificates && \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  gpg --dearmor > /etc/apt/trusted.gpg.d/pgbackrest.gpg && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
apt-get update && \
apt-get install -y pgbackrest && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/lib/pgbackrest

# Run a command to keep the container running
CMD tail -f /dev/null
