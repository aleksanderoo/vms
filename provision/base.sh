#!/bin/bash
set -euo pipefail

# Base provisioner — runs on every VM.
# Add packages that belong in every machine here.

apt-get update -qq
apt-get install -y \
    git \
    curl \
    wget \
    vim \
    htop \
    unzip \
    ca-certificates
