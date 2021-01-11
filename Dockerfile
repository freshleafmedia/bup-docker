FROM debian:stable

RUN apt-get update && apt-get -y install build-essential python3-dev python3-pytest python3-fuse python3-pyxattr pkg-config linux-libc-dev libacl1-dev acl attr python3-tornado git rsync curl kmod

RUN git clone https://github.com/bup/bup && \
    cd bup && \
    git checkout 0.32 && \
    make && \
    make check && \
    make install

ENTRYPOINT ["/usr/local/lib/bup/cmd/bup"]
