package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//container:container.bzl", "container_layer")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle_debian10//file:packages.bzl", "packages")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_file")
load("@io_bazel_rules_docker//contrib:group.bzl", "group_entry", "group_file")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load(":php-extensions.bzl", "php_extensions")

PHP_VERSION = "7.3"
# www-data user UID
WWW_DATA = 33

# Dictionary that contains all the enabled extensions, their priorities and source paths
PHP_EXT = {
    'calendar': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/calendar.ini'},
    'ctype': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/ctype.ini'},
    'dom': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/dom.ini'},
    'exif': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/exif.ini'},
    'fileinfo': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/fileinfo.ini'},
    'ftp': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/ftp.ini'},
    'gd': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-gd/gd/gd.ini'},
    'gettext': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/gettext.ini'},
    'iconv': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/iconv.ini'},
    'json': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-json/json/json.ini'},
    'mbstring': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-mbstring/mbstring/mbstring.ini'},
    'mysqlnd': { 'prio': '10', 'path': '/usr/share/php' + PHP_VERSION + '-mysql/mysql/mysqlnd.ini'},
    'opcache': { 'prio': '10', 'path': '/usr/share/php' + PHP_VERSION + '-opcache/opcache/opcache.ini'},
    'pdo_mysql': { 'prio': '10', 'path': '/usr/share/php' + PHP_VERSION + '-mysql/mysql/pdo_mysql.ini'},
    'pdo': { 'prio': '10', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/pdo.ini'},
    'phar': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/phar.ini'},
    'posix': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/posix.ini'},
    'readline': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-readline/readline/readline.ini'},
    'shmop': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/shmop.ini'},
    'simplexml': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/simplexml.ini'},
    'sockets': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/sockets.ini'},
    'sysvmsg': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/sysvmsg.ini'},
    'sysvsem': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/sysvsem.ini'},
    'sysvshm': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/sysvshm.ini'},
    'tokenizer': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-common/common/tokenizer.ini'},
    'wddx': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/wddx.ini'},
    'xml': { 'prio': '15', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/xml.ini'},
    'xmlreader': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/xmlreader.ini'},
    'xmlwriter': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/xmlwriter.ini'},
    'xsl': { 'prio': '20', 'path': '/usr/share/php' + PHP_VERSION + '-xml/xml/xsl.ini'},
}

PHP_LINKS = {
        "/usr/bin/php": "/usr/bin/php" + PHP_VERSION,
        "/usr/sbin/php-fpm": "/usr/sbin/php-fpm" + PHP_VERSION
}

distro_suffix = "_debian10"

container_layer(
    name = "php_dirs",
    empty_dirs = ["/run/php", "/var/lib/php/modules/" + PHP_VERSION + "/registry"],
    mode = "755",
)

container_layer(
    name = "php_sessions",
    empty_dirs = ["/var/lib/php/sessions"],
    # We set sticky bit so others can write and execute on the dir
    # but not reading or deleting others files
    mode = "1733",
)

# Create a passwd file with a nonroot user and uid.
passwd_entry(
    name = "www-data_user",
    info = "www-data",
    uid = WWW_DATA,
    gid = WWW_DATA,
    home = "/var/www",
    username = "www-data",
)

passwd_file(
    name = "passwd",
    entries = [
        ":www-data_user",
    ],
)

group_entry(
    name = "www-data_group",
    groupname = "www-data",
    gid = WWW_DATA,
    users = [ "www-data" ],
)

group_file(
    name = "group",
    entries = [
        ":www-data_group",
    ],
)

pkg_tar(
    name = "passwd_tar",
    srcs = [":passwd"],
    mode = "0644",
    package_dir = "etc",
)

pkg_tar(
    name = "group_tar",
    srcs = [":group"],
    mode = "0644",
    package_dir = "etc",
)

pkg_tar(
    name = "php_fpm_www_pool",
    srcs = ["conf/zz-www.conf"],
    mode = "0644",
    package_dir = "etc/php/" + PHP_VERSION + "/fpm/pool.d/"
)

# Builds php-cli image with base extensions: common + json + opcache + readline

[container_image(
    name = ("php-fpm" if (not mode) else mode[1:]) + PHP_VERSION,
    base = "//cc" + (mode if mode else ":cc") + distro_suffix,
    layers = ["php_dirs", "php_sessions"],
    tars = [":passwd_tar", ":group_tar", ":php_fpm_www_pool"],
    debs = [
        packages["libapparmor1"],
        packages["libargon2-1"],
        packages["libbsd0"],
        packages["libedit2"],
        packages["libexpat1"],
        packages["libfontconfig1"],
        packages["libfreetype6"],
        packages["libgcrypt20"],
        packages["libgd3"],
        packages["libgpg-error0"],
        packages["libicu63"],
        packages["libjbig0"],
        packages["libjpeg62-turbo"],
        packages["liblz4-1"],
        packages["liblzma5"],
        packages["libmagic1"],
        packages["libmagic-mgc"],
        packages["libncurses6"],
        packages["libpcre2-8-0"],
        packages["libpng16-16"],
        packages["libsodium23"],
        packages["libssl1.1"],
        packages["libsystemd0"],
        packages["libtiff5"],
        packages["libtinfo6"],
        packages["libuuid1"],
        packages["libwebp6"],
        packages["libx11-6"],
        packages["libx11-data"],
        packages["libxau6"],
        packages["libxcb1"],
        packages["libxdmcp6"],
        packages["libxml2"],
        packages["libxpm4"],
        packages["libxslt1.1"],
        packages["libzstd1"],
        packages["mime-support"],
        packages["php" + PHP_VERSION + "-mbstring"],
        packages["php" + PHP_VERSION + "-xml"],
        packages["php" + PHP_VERSION + "-cli"],
        packages["php" + PHP_VERSION + "-common"],
        packages["php" + PHP_VERSION + "-fpm"],
        packages["php" + PHP_VERSION + "-gd"],
        packages["php" + PHP_VERSION + "-json"],
        packages["php" + PHP_VERSION + "-mysql"],
        packages["php" + PHP_VERSION + "-opcache"],
        packages["php" + PHP_VERSION + "-readline"],
        packages["zlib1g"],
    ],
    entrypoint = [
        "/usr/sbin/php-fpm",
        "-F",
        "-O"
    ],
    env = {"LANG": "C.UTF-8"},
    symlinks = dict(php_extensions(PHP_EXT, PHP_VERSION).items() + PHP_LINKS.items()),
) for mode in [
    "",
    ":debug",
]]

container_test(
    name = "php-fpm" + PHP_VERSION + "_test",
    size = "medium",
    configs = ["testdata/debian10.yaml"],
    image = ":php-fpm" + PHP_VERSION,
)
