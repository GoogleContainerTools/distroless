load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":version.bzl", "clean_python_version")

def _clean_python_version_test_impl(ctx):
    env = unittest.begin(ctx)

    # Standard Debian version: upstream-revision
    asserts.equals(env, "3.13.5", clean_python_version("3.13.5-2"))

    # With epoch: epoch:upstream-revision
    asserts.equals(env, "3.13.5", clean_python_version("1:3.13.5-2"))

    # With epoch and complex revision (e.g. backport)
    asserts.equals(env, "3.13.5", clean_python_version("1:3.13.5-2+deb13u3"))

    # Raw upstream only (no revision, no epoch)
    asserts.equals(env, "3.13.5", clean_python_version("3.13.5"))

    # Upstream containing hyphens (should preserve hyphens in upstream, split at last hyphen)
    asserts.equals(env, "3.13.5-rc1", clean_python_version("3.13.5-rc1-1"))

    # Upstream containing hyphens and epoch
    asserts.equals(env, "3.13.5-rc1", clean_python_version("1:3.13.5-rc1-1"))

    # Upstream containing colons (unlikely but test robustness)
    # partition(":")[:] should handle it if we only split at first colon
    asserts.equals(env, "3.13:5", clean_python_version("1:3.13:5-1"))

    return unittest.end(env)

clean_python_version_test = unittest.make(
    impl = _clean_python_version_test_impl,
)
