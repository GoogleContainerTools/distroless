package(default_visibility = ["//visibility:public"])

# Verify the build environment is correctly configured
genrule(
    name = "check_build_env",
    outs = ["build_env.txt"],
    cmd = "echo 'Build Environment Report' > $@ && echo 'User:' >> $@ && id >> $@ && echo 'Host:' >> $@ && hostname >> $@ && echo 'OS:' >> $@ && uname -a >> $@",
)
