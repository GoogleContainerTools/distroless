import unittest
import os

from package_manager.parse_metadata import parse_package_metadata

class TestParseMetadata(unittest.TestCase):


    def setUp(self):
        current_dir = os.path.dirname(__file__)
        filename = os.path.join(current_dir, 'testdata', 'Packages.txt')
        with open(filename) as f:
            data = f.read()
        self.data = data
        self.mirror_url = "http://debian.org"
        self.metadata = parse_package_metadata(self.data, self.mirror_url)

    def test_url_rewrite(self):
        """ Relative url should have gotten rewritten with absolute url """
        self.assertEqual(
            self.metadata["libnewlib-dev"]["Filename"],
            self.mirror_url + "/debian/" + "pool/main/n/newlib/libnewlib-dev_2.1.0+git20140818.1a8323b-2_all.deb")

    def test_get_all_packages(self):
        """ Parser should identify all packages """
        expected_packages = ["libnewlib-dev",
                             "libnewlib-doc",
                             "newlib-source",
                             "newmail",
                             "zzuf",]
        for _ in expected_packages:
            self.assertEqual(expected_packages.sort(), self.metadata.keys().sort())

    def test_multiline_key(self):
        """ Multiline keys should be properly parsed """
        expected_tags = "interface::commandline, mail::notification, role::program,scope::utility, works-with::mail"
        self.assertEqual(expected_tags, self.metadata["newmail"]["Tag"])

if __name__ == '__main__':


    unittest.main()
