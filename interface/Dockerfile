FROM php:8.2-cli

ENV HOME=/var/www/html
WORKDIR $HOME

COPY ./src/composer.json /var/www/html
COPY ./src/composer.lock /var/www/html

RUN apt-get update && apt-get install -y libpq-dev git unzip  && \
    docker-php-ext-install pgsql && \
    pecl install xdebug-3.2.1 && \
    docker-php-ext-enable xdebug

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Para o caso do composer implicar com a origem de alguns pacotes.
RUN cd /var/www/html
RUN yes | composer install

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/html/public"]
