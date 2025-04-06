# Use Amazon Linux 2 as base image
FROM amazonlinux:2

# Install dependencies
RUN yum update -y && \
    yum install -y httpd git && \
    yum clean all

# Copy the website content
RUN git clone https://github.com/chagak/honey-static-webapp.git /tmp/honey-static-webapp && \
    cp -r /tmp/honey-static-webapp/* /var/www/html/ && \
    rm -rf /tmp/honey-static-webapp

# Expose HTTP port
EXPOSE 80

# Enable and run Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
