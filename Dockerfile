FROM ubuntu:20.04

# https://devopscube.com/reduce-docker-image-size/

# Setup 
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl python3 psmisc && apt-get upgrade -y && rm -rf /var/cache/apt

# Install Flutter
RUN git clone --depth 1 --branch 3.3.10 https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
ENV HTTP_TIMEOUT=5000
RUN flutter doctor -v

# Copy files to container and get dependencies
COPY . /usr/local/bin/app
WORKDIR /usr/local/bin/app
RUN flutter pub get
# RUN flutter build web
RUN chmod 755 /usr/local/bin/app/server/server.sh

# Document the exposed port and start serser
EXPOSE 5000
ENTRYPOINT [ "/usr/local/bin/app/server/server.sh" ]