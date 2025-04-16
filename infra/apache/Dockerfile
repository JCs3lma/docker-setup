# Using apline for smaller image size
FROM httpd:alpine

RUN \
    # Enable the virtual hosts include for custom vhosts configuration in main httpd.conf
    sed -i 's|#Include conf/extra/httpd-vhosts.conf|Include conf/extra/httpd-vhosts.conf|' /usr/local/apache2/conf/httpd.conf \
    # Enable mode_proxy and mod_proxy_fcgi for handling fastcgi in main httpd.conf
    && sed -i 's|#LoadModule proxy_module|LoadModule proxy_module|' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's|#LoadModule proxy_fcgi_module|LoadModule proxy_fcgi_module|' /usr/local/apache2/conf/httpd.conf \
    # Enable rewrite_module for handling rewrite requested URLS
    && sed -i 's|#LoadModule rewrite_module|LoadModule rewrite_module|' /usr/local/apache2/conf/httpd.conf

COPY httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
