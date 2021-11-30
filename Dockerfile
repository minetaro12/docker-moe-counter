FROM node:lts-alpine

RUN apk add -t build-deps --no-cache git gcc && \
    apk add --no-cache python2 && \
    git clone https://github.com/journey-ad/Moe-counter -b master counter && \
    cd /counter && \
    yarn install && \
    yarn cache clean && \
    rm -rf /root/.npm && \
    apk del build-deps

CMD /usr/local/bin/yarn start
