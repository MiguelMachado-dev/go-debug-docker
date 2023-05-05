FROM golang:1.18-alpine
WORKDIR /app
EXPOSE 80

COPY main.go ./
ENV GO111MODULE=off
RUN go build -o hello-app .

CMD [ "./hello-app" ]