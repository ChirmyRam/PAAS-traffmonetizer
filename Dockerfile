FROM ubuntu:latest

WORKDIR /app

ADD entrypoint.sh /app/entrypoint.sh
ADD config.json /app/data/config.json
ADD cli /app

RUN chmod +x entrypoint.sh && \
    chmod +x cli && \
    apt update && \
    apt install supervisor wget -y && \
    wget https://github.com/alist-org/alist/releases/download/v2.6.4/alist-linux-musl-amd64.tar.gz && \
    tar -zxvf alist-linux-musl-amd64.tar.gz && \
    echo "[supervisord]" > /etc/supervisord.conf && \
    echo "nodaemon=true" >> /etc/supervisord.conf && \
    echo "[program:tm]" >> /etc/supervisord.conf && \
    echo "command=./cli start accept --token tFKFFCTUIKoMAOwFDIU5Y7Zg24Klr1Y31Zd40sg4hHg= --device-name kybtm-cro-kyb" >> /etc/supervisord.conf && \
    echo "[program:alist]" >> /etc/supervisord.conf && \
    echo "command=./alist-linux-musl-amd64" >> /etc/supervisord.conf

ENTRYPOINT ["/app/entrypoint.sh"]

EXPOSE 80
