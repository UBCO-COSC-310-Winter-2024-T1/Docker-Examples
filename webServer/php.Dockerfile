FROM php:7.4.3-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN mkdir -p /var/www/html/uploads
RUN chmod -R 775 /var/www/html/uploads
RUN chown -R www-data /var/www/html/uploads