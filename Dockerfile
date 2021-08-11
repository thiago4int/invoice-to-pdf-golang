FROM debian:buster as builder
RUN apt-get update -y \
  && apt-get install -y libreoffice \
  && apt-get clean

FROM scratch

COPY --from=builder . .

WORKDIR /usr/src/app

COPY server .
CMD [ "./server" ]