
# session.save_path
RUN echo "session.save_path = /var/lib/php/sessions" > /usr/local/etc/php/conf.d/session.ini

# Mengaktifkan mod_rewrite Apache
RUN a2enmod rewrite

# Menyalin kode iTop ke dalam container
COPY ../web /var/www/html

# Mengatur kepemilikan dan izin direktori
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

WORKDIR /var/www/html
