FROM debian:buster-slim
RUN apt-get update -y \
  && apt-get install -f -y libreoffice \
  && apt-get clean
WORKDIR /usr/src/app
COPY server .
CMD [ "./server" ]