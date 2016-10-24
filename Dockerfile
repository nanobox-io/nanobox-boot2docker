FROM boot2docker/boot2docker

ENV TCL_REPO_BASE   http://tinycorelinux.net/7.x/x86_64
# Note that the ncurses is here explicitly so that top continues to work
ENV NANO_DEPS coreutils samba-libs cifs-utils

RUN set -ex && \
    for dep in $NANO_DEPS; do \
        echo "Download $TCL_REPO_BASE/tcz/$dep.tcz"; \
        curl -fL -o /tmp/$dep.tcz $TCL_REPO_BASE/tcz/$dep.tcz; \
        unsquashfs -f -d $ROOTFS /tmp/$dep.tcz; \
        rm -f /tmp/$dep.tcz; \
    done

RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]