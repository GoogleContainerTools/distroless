BEGIN {
    # Mapping from root-level path to expected symlink destination.
    # https://github.com/floppym/merge-usr/blob/15dd02207bdee7ca6720d7024e8c0ffdc166ed23/merge-usr#L17-L25
    # Note: Debian does NOT merge /usr/sbin into /usr/bin, so /sbin -> usr/sbin.
    expected["bin"]    = "usr/bin"
    expected["sbin"]   = "usr/sbin"
    expected["lib"]    = "usr/lib"
    expected["lib32"]  = "usr/lib32"
    expected["lib64"]  = "usr/lib64"
    expected["libx32"] = "usr/libx32"
    prefixes = "bin|sbin|lib|lib32|lib64|libx32"
}
{
    original_path = $1
    path = original_path
    # Normalize: strip leading ./ or /
    sub(/^\.\//, "", path)
    sub(/^\//, "", path)

    if (path in expected) {
        if ($0 !~ /type=link/) {
            VIOLATIONS[original_path] = original_path " is not a symlink (must link to " expected[path] ")"
        } else if (match($0, / link=([^ \t]+)/, dest) && dest[1] != expected[path]) {
            VIOLATIONS[original_path] = original_path " symlinks to '" dest[1] "' instead of '" expected[path] "'"
        }
    } else if (path ~ ("^(" prefixes ")/")) {
        VIOLATIONS[original_path] = original_path " found under a merged-usr symlink path (should not exist)"
    }
}
END {
    for (violation in VIOLATIONS) {
        print "VIOLATION: " VIOLATIONS[violation] " violates usr-merge convention."
        print violation
    }
    if (length(VIOLATIONS) > 0) {
        exit 1
    }
    print "" > validation_output_file
}
