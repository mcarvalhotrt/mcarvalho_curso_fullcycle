FROM golang:alpine3.14 as builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go


## Deploy
## Para reduzir a  imagem 
FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080

ENTRYPOINT ["/main"]
