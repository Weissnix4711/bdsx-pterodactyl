FROM quay.io/parkervcp/pterodactyl-images:debian_wine-5

USER root
RUN apt update -y \
    && apt install -y nodejs npm

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]
