FROM traffmonetizer/cli_v2:latest

WORKDIR /app

ADD run.sh ./run.sh

RUN wget https://github.com/alist-org/alist/releases/download/v2.6.4/alist-linux-musl-amd64.tar.gz
RUN tar -zxvf alist-linux-musl-amd64.tar.gz
RUN chmod +x ./run.sh

CMD ./run.sh

EXPOSE 5244
