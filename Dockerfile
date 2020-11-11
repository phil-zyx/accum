#  编译阶段
FROM golang:1.13.3 AS compiler
RUN mkdir -p    /go/src/accum/log
ADD . /go/src/accum

# 编译
WORKDIR /go/src/accum

RUN go build -o bin/server  github.com/rcdall/accum/server

# 发布阶段
FROM golang:1.13
RUN mkdir -p /go/src/accum/log
WORKDIR /go/src/accum

COPY --from=compiler /go/src/accum/bin/server .

# 默认入口是 game
ENTRYPOINT ["./server"]