FROM nervos/ckb-docker-builder:bionic-rust-1.41.0 as builder
LABEL maintainer="muxueqz <zhangmingyuan240@gmail.com>"

WORKDIR /app
COPY ./ .

RUN cd bins && cargo build --release

FROM ubuntu:bionic
COPY --from=builder /app/bins/target/release/ckb-debugger /opt/debugger/
