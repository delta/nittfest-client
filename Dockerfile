FROM ubuntu:20.04 AS build-env

RUN apt-get update &&\
    apt-get install -y curl unzip git &&\ 
    apt-get clean

RUN git clone --depth=1 https://github.com/flutter/flutter.git -b stable

ENV PATH="/flutter/bin:${PATH}"

WORKDIR /app

COPY pubspec.* ./

RUN flutter channel stable &&\
    flutter config --no-enable-android \
    --no-enable-linux-desktop \
    --no-enable-windows-desktop \
    --no-enable-macos-desktop \
    --no-enable-windows-uwp-desktop \
    --no-enable-ios &&\
    flutter config --enable-web &&\
    flutter precache &&\
    flutter pub get

COPY . .

RUN flutter build web --release

FROM nginx:1.21.5-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
