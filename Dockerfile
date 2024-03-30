FROM traffmonetizer/cli_v2:latest

WORKDIR /app

ENTRYPOINT ["./Cli", "start", "accept", "--token", "tFKFFCTUIKoMAOwFDIU5Y7Zg24Klr1Y31Zd40sg4hHg=", "--device-name", "patr"]
