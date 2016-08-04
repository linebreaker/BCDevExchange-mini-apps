FROM node:4.4.3-wheezy

# Sails setup
WORKDIR /app/
ADD package.json /app/
ADD Gruntfile.js /app/
RUN npm install npm -g && npm install
ADD . .

RUN adduser --system devex && chown -R devex:0 . && chmod -R 770 .

USER devex

VOLUME /app

EXPOSE 1337

ENV NODE_ENV=production

CMD ["node","app.js"]
