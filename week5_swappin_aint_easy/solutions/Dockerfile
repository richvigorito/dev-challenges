FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install core utilities and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    make \
    python3 \
    python3-pip \
    openjdk-17-jdk \
    ruby \
    php \
    bash \
    fpc \
    golang \
    rustc \
    erlang \
    sbcl \
    elixir \
    scala \
    vim \
    curl \
    git \
    unzip \
    libffi-dev \
    libgmp-dev \
    libncurses-dev \
    pkg-config \
    zlib1g-dev \
    gfortran \  # Added gfortran for Fortran compiler
    && apt-get clean

# Install Swift manually
RUN curl -O https://download.swift.org/swift-6.0.3-release/ubuntu2404/swift-6.0.3-RELEASE/swift-6.0.3-RELEASE-ubuntu24.04.tar.gz && \
    tar -xzf swift-6.0.3-RELEASE-ubuntu24.04.tar.gz && \
    mv swift-6.0.3-RELEASE-ubuntu24.04 /usr/share/swift && \
    echo 'export PATH=/usr/share/swift/usr/bin:$PATH' >> /etc/profile.d/swift.sh

# Install Haskell via GHCup
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | bash -s -- -y
ENV PATH="/root/.ghcup/bin:${PATH}"

# Install Clojure CLI
RUN curl -O https://download.clojure.org/install/linux-install-1.11.1.1149.sh && \
    chmod +x linux-install-1.11.1.1149.sh && \
    ./linux-install-1.11.1.1149.sh

# Set default working directory
WORKDIR /workspace

# Copy all files into container
COPY . /workspace

# Make sure run_all.sh is executable
RUN chmod +x run_all.sh

CMD ["/bin/bash"]

