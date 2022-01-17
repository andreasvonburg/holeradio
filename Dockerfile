FROM php:8.1-apache

LABEL io.openshift.expose-services="8080"

RUN sed -i '/Listen/{s/\([0-9]\+\)/8080/; :a;n; ba}' /etc/apache2/ports.conf && \
    sed -i "s/:80/:8080/g" /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-install zip


ENV APACHE_DOCUMENT_ROOT /var/www/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf


#RUN apt-get update && \
#    apt-get install -y \
#        zlib1g-dev libzip-dev sendmail

#RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini

#RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint

#RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

# And clean up the image
#RUN rm -rf /var/lib/apt/lists/*




EXPOSE 8080

COPY . /var/www/