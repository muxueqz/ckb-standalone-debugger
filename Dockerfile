FROM nervos/ckb-docker-builder:bionic-rust-1.41.0 as builder
LABEL maintainer="muxueqz <zhangmingyuan240@gmail.com>"

WORKDIR /app
COPY ./ .

RUN cargo build --release && cp -v ./bins/target/release/ckb-debugger /opt/

FROM ubuntu:bionic
COPY --from=builder /opt/ckb-debugger /opt/debugger/
