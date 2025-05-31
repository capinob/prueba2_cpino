FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias
RUN apt-get update && apt-get install -y \
    apache2 \
    wget \
    unzip \
    build-essential \
    libgd-dev \
    libapache2-mod-php \
    php \
    libperl-dev \
    libssl-dev \
    curl && \
    apt-get clean

# Crea usuario y grupo nagios
RUN useradd nagios && groupadd nagcmd && usermod -a -G nagcmd nagios && usermod -a -G nagcmd www-data

# Descarga Nagios Core y plugins
WORKDIR /tmp
RUN wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.14.tar.gz && \
    tar -zxvf nagios-4.4.14.tar.gz && \
    cd nagios-4.4.14 && \
    ./configure --with-command-group=nagcmd && \
    make all && \
    make install && \
    make install-init && \
    make install-commandmode && \
    make install-config && \
    make install-webconf

# Configura Apache y habilita CGI
RUN a2enmod cgi && \
    htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

# Instala plugins de Nagios
RUN wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz && \
    tar -zxvf nagios-plugins-2.3.3.tar.gz && \
    cd nagios-plugins-2.3.3 && \
    ./configure --with-nagios-user=nagios --with-nagios-group=nagios && \
    make && \
    make install

# Copia script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
