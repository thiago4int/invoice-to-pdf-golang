FROM debian:buster-slim
RUN apt-get update -y \
  && apt-get install -y default-jdk \
  && apt-get install -y libreoffice \
  && apt-get clean
WORKDIR /usr/src/app
COPY server .
CMD [ "./server" ]