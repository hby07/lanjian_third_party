FROM golang:alpine AS builder

#ENV GO111MODULE=on \
#    CGO_ENABLED=0 \
#    GOOS=linux \
#    GOARCH=amd64

WORKDIR /app

COPY . .

RUN go build -o lanjian_third_party_1.0 ./main.go

FROM scratch

COPY --from=builder /app/lanjian_third_party_1.0 /

ENTRYPOINT ["/lanjian_third_party_1.0"]
