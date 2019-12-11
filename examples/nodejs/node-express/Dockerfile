FROM node:12.13.1 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --production

FROM gcr.io/distroless/nodejs
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 3000
CMD ["hello_express.js"]
