FROM traffmonetizer/cli_v2:latest

WORKDIR /app

ADD entrypoint.sh /app/entrypoint.sh
ADD config.json /app/data/config.json

RUN chmod +x entrypoint.sh && \
    apk add --no-cache supervisor && \
    wget https://github.com/alist-org/alist/releases/download/v2.6.4/alist-linux-musl-amd64.tar.gz && \
    tar -zxvf alist-linux-musl-amd64.tar.gz && \
    echo "[supervisord]" > /etc/supervisord.conf && \
    echo "nodaemon=true" >> /etc/supervisord.conf && \
    echo "[program:cli]" >> /etc/supervisord.conf && \
    echo "command=./Cli start accept --token tFKFFCTUIKoMAOwFDIU5Y7Zg24Klr1Y31Zd40sg4hHg= --device-name kybtm-off1" >> /etc/supervisord.conf && \
    echo "[program:alist]" >> /etc/supervisord.conf && \
    echo "command=./alist-linux-musl-amd64" >> /etc/supervisord.conf

ENTRYPOINT ["/app/entrypoint.sh"]

EXPOSE 80
