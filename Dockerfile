## -*- plan9port-image-name: "armbuild/ocs-app-plan9port:vivid" -*-
FROM armbuild/ocs-distrib-ubuntu:vivid


# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update &&      \
    apt-get -y -qq upgrade && \
    apt-get install -y -q     \
        build-essential       \
    && apt-get clean


RUN mkdir /usr/local/plan9port && wget -qO - https://github.com/9fans/plan9port/archive/master.tar.gz | tar --strip=1 -C /usr/local/plan9port -xzf -
RUN cd /usr/local/plan9port && ./INSTALL
RUN printf "export PLAN9=/plan9port\nexport PATH=\$PATH:\$PLAN9/bin" > /root/.bashrc

# Patch rootfs
ADD ./patches/etc/ /etc/


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
