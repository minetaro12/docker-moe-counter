FROM node:lts-alpine

#必要なパッケージをインストール
RUN apk add --no-cache git python2

#リポジトリのクローン
RUN git clone https://github.com/journey-ad/Moe-counter -b master counter

#依存関係のインストール
RUN cd /counter && \
    yarn install && \
    yarn cache clean && \
    rm -rf /root/.npm

CMD /usr/local/bin/yarn start
