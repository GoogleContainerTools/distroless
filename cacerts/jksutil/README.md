# Java Key Store

A utility for converting public PEM certs to a Java Key Store.

    cat /etc/ssl/certs/*.pem | ./jksutil > /etc/ssl/certs/java/cacerts
