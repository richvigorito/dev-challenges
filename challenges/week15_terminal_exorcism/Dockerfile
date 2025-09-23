FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    nano less coreutils findutils locales

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

WORKDIR /root/files

COPY make_weird_files.sh /tmp/
RUN bash /tmp/make_weird_files.sh

WORKDIR /root
RUN mkdir /root/challenge \
 && echo "Delete ALL files in /root/files using ONLY shell commands — without using 'find . -exec' or 'rm *'." > /root/challenge/instructions.txt

WORKDIR /root
ENTRYPOINT ["/bin/bash"]
