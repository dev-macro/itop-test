#!/bin/bash
set -e

# Mengatur kepemilikan direktori iTop
chown -R www-data:www-data /var/www/html

# Mengatur izin direktori yang diperlukan
chmod -R 755 /var/www/html

chown -R www-data:www-data /var/lib/php/sessions
chmod -R 755 /var/lib/php/sessions

# Menjalankan perintah default
exec "$@"
