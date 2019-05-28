FROM docker.swift.com:5000/httpd:latest
MAINTAINER Yin Xu <yin.xu@swift.com>

# Configure: jsqrcode libraries
ADD llqrcode.js webqr.js jquery-3.1.0.min.js bootstrap.min.css bootstrap.min.js /var/www/html/

# Configure: index page
ADD *.html /var/www/html/
RUN chown apache:apache /var/www/html/ && \
	chown apache:apache /var/www/html/*.html

# Configure: strapdown
ADD strapdown.tar.gz /usr/local/lib/

# Configure: markdown
ADD markdown.cgi /var/www/cgi-bin/
RUN chmod 0755 /var/www/cgi-bin/markdown.cgi

# Configure: httpd
COPY apache.markdown /etc/httpd/vhost.d/markdown
RUN chmod 0644 /etc/httpd/vhost.d/markdown
