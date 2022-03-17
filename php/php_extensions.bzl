def php_extensions(extensions, php_version):
    """
    Creates a dict containing php extensions links for CLI and FPM variants and their targets
    :extensions: dict containing extension name, priority and source path
    :php_version: string containing the supported php version
    :returns: dict with links and targets
    Example result:
    {'/etc/php/8.0/conf.d/10-opcache.ini' : '/usr/share/php8.0-opcache/opcache/opcache.ini'}
    """

    # Link extensions to be available in php cli and fpm runtimes
    php_ext_variants = ["cli", "fpm"]
    dest_path = "/etc/php/{version}/{php_variant}/conf.d/{prio}-{name}.ini"
    ext = {}

    for (k, v) in extensions.items():
        for variant in php_ext_variants:
            ext[dest_path.format(version = php_version, php_variant = variant, prio = v["prio"], name = k)] = v["path"]
    return ext
