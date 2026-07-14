"Python version helper functions"

def clean_python_version(version_string):
    """Clean Debian package version to get upstream Python version.

    Handles epochs (prefix before first ':') and Debian revisions (suffix after last '-').
    """

    # Handle epoch (split at first ':')
    epoch_parts = version_string.partition(":")
    if epoch_parts[1]:  # separator found
        version_string = epoch_parts[2]
    else:
        version_string = epoch_parts[0]

    # Handle revision (split at last '-')
    rev_parts = version_string.rpartition("-")
    if rev_parts[1]:  # separator found
        version_string = rev_parts[0]
    else:
        version_string = rev_parts[2]

    return version_string
