FROM weissnix/pterodactyl-images:debian_wine-6

USER root
RUN apt update -y \
    && apt install -y nodejs npm libfreetype6

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]
