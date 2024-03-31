FROM traffmonetizer/cli_v2:latest

WORKDIR /app

RUN wget https://github.com/alist-org/alist/releases/download/v2.6.4/alist-linux-musl-amd64.tar.gz
RUN tar -zxvf alist-linux-musl-amd64.tar.gz

CMD ["./Cli", "start", "accept", "--token", "tFKFFCTUIKoMAOwFDIU5Y7Zg24Klr1Y31Zd40sg4hHg=", "--device-name", "kyb", "&", "./alist-linux-musl-amd64"]

EXPOSE 5244
