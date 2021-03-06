FROM golang:1.15

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
RUN go get google.golang.org/grpc@v1.34.0
RUN go get google.golang.org/protobuf/cmd/protoc-gen-go@v1.25.0
RUN go get google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.0.1
RUN go get github.com/envoyproxy/protoc-gen-validate@v0.4.1-java