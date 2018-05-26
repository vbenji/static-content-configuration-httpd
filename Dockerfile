FROM httpd:2.4-alpine

# Add simple http page for example
COPY htdocs/index.html /usr/local/apache2/htdocs/

# Add custom configuration file
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf
