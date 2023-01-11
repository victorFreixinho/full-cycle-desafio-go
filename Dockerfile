FROM golang:1.19 AS heavy-stage

WORKDIR /usr/src/app

COPY . .
RUN go mod init app && \
go build -v -o /usr/local/bin/app

FROM scratch AS light-stage
COPY --from=heavy-stage /usr/local/bin/app /

CMD ["/app"]
