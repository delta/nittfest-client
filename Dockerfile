FROM ubuntu AS build-env

RUN apt-get update &&\
    apt-get install --no-install-recommends -y git curl wget zip unzip xz-utils openjdk-11-jdk &&\ 
    apt-get clean &&\ 
    git clone https://github.com/flutter/flutter.git /usr/local/flutter 
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
COPY . /app
WORKDIR /app/
RUN flutter doctor -v &&\
    flutter channel master &&\
    flutter upgrade &&\
    flutter config --enable-web &&\
    flutter pub get &&\
    flutter build web

FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
