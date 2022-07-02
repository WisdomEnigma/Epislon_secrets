FROM golang:1.19beta1-alpine3.15

# environment params  
ENV CGO_ENABLED=0

ENV MAC_ROTATION_KEY="tfZysa34TMOyFSI53LsGS*xTTagiU6UN6aAzxhKWW9Qn4X3qVVoFEPNPQJIi0p8xM="

RUN mkdir /app

ADD . /app

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

RUN go mod vendor

RUN go mod download

# build app 
RUN go build -o epilson

RUN go test ./...

CMD ["/app/epilson"]