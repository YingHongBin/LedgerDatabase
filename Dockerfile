FROM ubuntu:24.04

RUN apt update -y && \
    apt install -y \
        build-essential \
        librocksdb-dev \
        libboost-all-dev \
        protobuf-compiler \
        libcrypto++-dev libcrypto++-doc libcrypto++-utils \
        cmake \
        libtbb-dev \
        libssl-dev \