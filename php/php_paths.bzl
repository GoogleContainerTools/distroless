# Dictionary that contains all the enabled extensions, their priorities and source paths
def php_config(php_version):
    return {
        "ctype": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/ctype.ini",
        },
        "curl": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-curl/curl/curl.ini",
        },
        "dom": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-xml/xml/dom.ini",
        },
        "exif": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/exif.ini",
        },
        "fileinfo": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/fileinfo.ini",
        },
        "ftp": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/ftp.ini",
        },
        "gd": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-gd/gd/gd.ini",
        },
        "iconv": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/iconv.ini",
        },
        "intl": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-intl/intl/intl.ini",
        },
        "json": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-json/json/json.ini",
        },
        "mbstring": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-mbstring/mbstring/mbstring.ini",
        },
        "mysqlnd": {
            "prio": "10",
            "path": "/usr/share/php" + php_version + "-mysql/mysql/mysqlnd.ini",
        },
        "opcache": {
            "prio": "10",
            "path": "/usr/share/php" + php_version + "-opcache/opcache/opcache.ini",
        },
        "pdo_mysql": {
            "prio": "10",
            "path": "/usr/share/php" + php_version + "-mysql/mysql/pdo_mysql.ini",
        },
        "pdo": {
            "prio": "10",
            "path": "/usr/share/php" + php_version + "-common/common/pdo.ini",
        },
        "phar": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/phar.ini",
        },
        "posix": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/posix.ini",
        },
        "readline": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-readline/readline/readline.ini",
        },
        "simplexml": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-xml/xml/simplexml.ini",
        },
        "tokenizer": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-common/common/tokenizer.ini",
        },
        "xml": {
            "prio": "15",
            "path": "/usr/share/php" + php_version + "-xml/xml/xml.ini",
        },
        "xmlreader": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-xml/xml/xmlreader.ini",
        },
        "xmlwriter": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-xml/xml/xmlwriter.ini",
        },
        "zip": {
            "prio": "20",
            "path": "/usr/share/php" + php_version + "-zip/zip/zip.ini",
        },
        "apcu": {
            "prio": "20",
            "path": "/etc/php/" + php_version + "/mods-available/apcu.ini",
        },
    }

def php_binary(php_version):
    return {
        "/usr/bin/php": "/usr/bin/php" + php_version,
        "/usr/sbin/php-fpm": "/usr/sbin/php-fpm" + php_version,
    }
