import unittest
import os

from package_manager.parse_metadata import parse_package_metadata

class TestParseMetadata(unittest.TestCase):

    def setUp(self):
        current_dir = os.path.dirname(__file__)
        filename = os.path.join(current_dir, 'testdata', 'Packages.txt')
        # parse_package_metadata is called on the binary output of gzip.open
        with open(filename, 'rb') as f:
            data = f.read()
        self.data = data
        self.mirror_url = "http://debian.org"
        self.package_prefix = "http://dummy/prefix/"
        self.debian_repo_metadata = parse_package_metadata(self.data, self.mirror_url, "20170701", "")
        self.arbitrary_repo_metadata = parse_package_metadata(self.data, "", "", self.package_prefix)

    def test_debian_repo_url_rewrite(self):
        """ Relative url should have gotten rewritten with absolute url """
        self.assertEqual(
            self.debian_repo_metadata["libnewlib-dev"]["Filename"],
            self.mirror_url + "/debian/20170701/" + "pool/main/n/newlib/libnewlib-dev_2.1.0+git20140818.1a8323b-2_all.deb")

    def test_arbitrary_repo_url_rewrite(self):
        """ Relative url should have gotten rewritten with absolute url using the given package prefix """
        self.assertEqual(
            self.arbitrary_repo_metadata["libnewlib-dev"]["Filename"],
            self.package_prefix + "pool/main/n/newlib/libnewlib-dev_2.1.0+git20140818.1a8323b-2_all.deb")

    def test_get_all_packages(self):
        """ Parser should identify all packages """
        expected_packages = ["libnewlib-dev",
                             "libnewlib-doc",
                             "newlib-source",
                             "newmail",
                             "zzuf",]
        for _ in expected_packages:
            self.assertEqual(expected_packages.sort(), list(self.debian_repo_metadata.keys()).sort())

    def test_multiline_key(self):
        """ Multiline keys should be properly parsed """
        expected_tags = "interface::commandline, mail::notification, role::program,scope::utility, works-with::mail"
        self.assertEqual(expected_tags, self.debian_repo_metadata["newmail"]["Tag"])

if __name__ == '__main__':


    unittest.main()
