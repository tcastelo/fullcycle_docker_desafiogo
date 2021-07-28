FROM golang:latest AS go
WORKDIR /usr/src/app
COPY . .
RUN go build -ldflags "-w -s" desafio.go
RUN ls -lh

FROM scratch
WORKDIR /usr/src/app
COPY --from=go /usr/src/app/desafio .
CMD ["./desafio"]