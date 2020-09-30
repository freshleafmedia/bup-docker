FROM debian:stable

RUN apt-get update && apt-get -y install build-essential python2.7-dev python-fuse python-pyxattr pkg-config linux-libc-dev libacl1-dev acl attr python-tornado git rsync curl kmod

RUN git clone https://github.com/bup/bup && \
    cd bup && \
    git checkout 0.31 && \
    make && \
    make check && \
    make install

ENTRYPOINT ["/usr/local/lib/bup/cmd/bup"]
