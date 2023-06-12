FROM ubuntu:20.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-core gnupg flex bison build-essential zip \
curl zlib1g-dev libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev \
libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python python3 python3-pip

RUN export REPO=$(mktemp /tmp/repo.XXXXXXXXX) && curl -o ${REPO} https://storage.googleapis.com/git-repo-downloads/repo && gpg --recv-key 8BB9AD793E8E6153AF0F9A4416530D5E920F5C65 \
&& curl -s https://storage.googleapis.com/git-repo-downloads/repo.asc | gpg --verify - ${REPO} && install -m 755 ${REPO} /usr/local/bin/repo

WORKDIR /root/