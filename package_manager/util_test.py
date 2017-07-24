import unittest
from package_manager import util

CHECKSUM_TXT = "1915adb697103d42655711e7b00a7dbe398a33d7719d6370c01001273010d069"

class TestUtil(unittest.TestCase):

    def test_sha256(self):
        actual = util.sha256_checksum("checksum_txt")
        self.assertEqual(CHECKSUM_TXT, actual)
