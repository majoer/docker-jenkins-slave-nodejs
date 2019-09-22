FROM alpine:latest

ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 22
COPY rootfs /

RUN apk update
RUN apk upgrade

RUN apk add openjdk8
RUN apk add nodejs=~10

RUN apk add --no-cache openssh
RUN ssh-keygen -A
RUN addgroup -S jenkins && adduser -S jenkins -G jenkins -s /bin/sh
RUN echo "jenkins:jenkins" | chpasswd
