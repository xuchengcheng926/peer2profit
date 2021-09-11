FROM alpine:edge
LABEL org.opencontainers.image.authors="<chasing66@live.com>"
WORKDIR /root
ARG ALPINE_GLIBC_PACKAGE_VERSION="2.34-r0"
ARG ALPINE_GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" \
    ALPINE_GLIBC_BASE_PACKAGE_FILENAME="glibc-${ALPINE_GLIBC_PACKAGE_VERSION}.apk" \
    ALPINE_GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-${ALPINE_GLIBC_PACKAGE_VERSION}.apk" \
    ALPINE_GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"
RUN apk add --no-cache --virtual=.build-dependencies wget \
    && wget "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
    && apk add --no-cache --allow-untrusted \
    "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
    &&  /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "$LANG" || true && echo "export LANG=$LANG" > /etc/profile.d/locale.sh \
    && apk add --no-cache proxychains-ng \
    && apk del glibc-i18n && rm "/root/.wget-hsts" && apk del .build-dependencies wget \
    && rm "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
    && apk add --no-cache ca-certificates bash
COPY p2pclient /root/.
COPY proxychains.conf /etc/proxychains/proxychains.conf
COPY start.sh /root/.
RUN chmod +x /root/p2pclient && chmod +x /root/start.sh
ENV email=chasing66@live.com
ENV socks=127.0.0.1
ENTRYPOINT [ "/bin/sh", "-c", "/root/start.sh" ]
