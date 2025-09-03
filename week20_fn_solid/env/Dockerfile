FROM ubuntu:24.04

# Install core dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 python3-pip \
    openjdk-21-jdk \
    golang \
    dotnet-sdk-8.0 \
    nodejs npm \
    git curl wget nano vim \
    make \
    && rm -rf /var/lib/apt/lists/*

# Install TypeScript + ts-node globally
RUN npm install -g typescript ts-node

# Set working directory
WORKDIR /app

# Copy challenge files (read-only) and solutions (editable)
COPY challenge_files /app/files_readonly
COPY challenge_files /app/solidify_these_files
COPY solutions /app/solutions
COPY Makefile /app/Makefile

# Make challenge files read-only
RUN chmod -R 444 /app/files_readonly

# Test that files are executable (tho poorly written)
RUN make test

# Default to bash shell for interactive work
CMD ["/bin/bash"]
