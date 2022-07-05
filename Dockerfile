FROM php:8.1.5-bullseye

ENV GIT_USERNAME=""
ENV GIT_EMAIL=""

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list
RUN apt update && \
    apt install -y  symfony-cli

RUN usermod -u 1000 www-data

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
