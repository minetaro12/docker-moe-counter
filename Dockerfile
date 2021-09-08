FROM node:latest

#必要なパッケージをインストール
RUN apt update && apt install -y python2.7 git && apt clean && rm -rf /var/lib/apt/lists/*

#リポジトリのクローン
RUN git clone https://github.com/journey-ad/Moe-counter -b master counter

#依存関係のインストール
RUN cd /counter && yarn install && yarn cache clean && rm -rf /root/.npm

CMD /usr/local/bin/yarn start
