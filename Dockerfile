FROM nervos/ckb-docker-builder:bionic-rust-1.41.0 as builder
LABEL maintainer="muxueqz <zhangmingyuan240@gmail.com>"

WORKDIR /ckb
COPY ./ .

RUN cargo build --release

FROM ubuntu:bionic
COPY --from=builder ./bins/ /opt/debugger
