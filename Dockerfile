FROM openjdk:18-jdk-slim-buster as builder

RUN apt-get update && apt-get -y install \
  libreoffice-common \ 
  unoconv \
  hyphen-af hyphen-en-us \
  fonts-dejavu fonts-dejavu-core fonts-dejavu-extra \
  fonts-droid-fallback fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation \
  fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa fonts-opensymbol && \
  rm -rf /var/lib/apt/lists/*

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder . .

COPY server .
CMD [ "./server" ]