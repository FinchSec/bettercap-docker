FROM golang:1.20-bullseye as builder
# hadolint ignore=DL3005,DL3008,DL3013
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev -y --no-install-recommends
RUN go install github.com/bettercap/bettercap@HEAD

FROM debian:bullseye-slim
LABEL org.opencontainers.image.authors="thomas@finchsec.com"
COPY --from=builder /go/bin/bettercap /usr/local/bin/bettercap
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install iproute2 libpcap0.8 libusb-1.0-0 libnetfilter-queue1 -y --no-install-recommends && \
    apt-get autoclean && \
    rm -rf /var/lib/dpkg/status-old /var/lib/apt/lists/*
CMD [ "/usr/local/bin/bettercap" ]