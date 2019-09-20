FROM golang:1.13

# install protobuf from source
RUN apt-get update && \
    apt-get -y install git unzip build-essential autoconf libtool
RUN git clone https://github.com/google/protobuf.git && \
    cd protobuf && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    make clean && \
    cd .. && \
    rm -r protobuf

ENV GO111MODULE=on
RUN go get google.golang.org/grpc@v1.21.4
RUN go get github.com/golang/protobuf/protoc-gen-go@v1.3.2
RUN go get github.com/envoyproxy/protoc-gen-validate@v0.2.0-java