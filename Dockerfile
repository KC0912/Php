FROM php:8.1-apache

# Cài đặt các extension cần thiết (nếu dự án dùng MySQL)
RUN docker-php-ext-install pdo pdo_mysql

# Copy toàn bộ code vào thư mục làm việc của Apache
COPY . /var/www/html/

# Cấu hình để Apache trỏ vào thư mục public (nếu web của bạn chạy từ thư mục public)
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Cấp quyền cho Apache
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
