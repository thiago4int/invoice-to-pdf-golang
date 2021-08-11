FROM debian:buster as builder

WORKDIR /usr/src/app

RUN apt-get update -y \
  && apt-get install -y libreoffice \
  && apt-get clean

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/ .

COPY server .
CMD [ "./server" ]