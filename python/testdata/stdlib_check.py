#!/python/bin/python3
"""Import every available standard-library module in the distroless Python image
and exercise a representative set with one call each."""

import importlib
import pkgutil
import sys

skip_modules = frozenset((
    # Windows-specific modules
    "asyncio.windows_events",
    "asyncio.windows_utils",
    "ctypes.wintypes",
    "encodings.cp65001",
    "encodings.mbcs",
    "encodings.oem",
    "multiprocessing.popen_spawn_win32",
    "winreg",
    # Python regression tests.
    "test",
    # Calls sys.exit.
    "unittest.__main__",
    "venv.__main__",
    # python-build-standalone omits _gdbm.
    "dbm.gnu",
    # Platform-specific or GUI extensions not used in a server image.
    "_ios_support",
    "_tkinter",
    # The new REPL requires libncurses, which is not shipped.
    "_pyrepl",
    # Prints the Zen of Python on import.
    "this",
))

# Packages skipped during import: GUI modules (no Tcl/Tk in the image),
# idlelib (which exits without Tk), and removed distutils.
never_import = ("tkinter", "idlelib", "turtle", "distutils", "test", "venv")

failed = []

def walk(path, prefix=""):
    try:
        infos = list(pkgutil.iter_modules(path))
    except Exception as e:
        failed.append("walk %s: %s" % (path, e))
        return
    for info in infos:
        name = prefix + info.name
        if name in skip_modules or name.startswith(never_import):
            continue
        if info.ispkg:
            try:
                mod = importlib.import_module(name)
                if hasattr(mod, "__path__"):
                    walk(mod.__path__, name + ".")
            except BaseException as e:
                failed.append("%s: %s: %s" % (name, type(e).__name__, e))
            continue
        try:
            importlib.import_module(name)
            imported[0] += 1
        except BaseException as e:
            failed.append("%s: %s: %s" % (name, type(e).__name__, e))

import os

stdlib_root = os.path.join(os.path.dirname(sys.executable), os.pardir, "lib", "python%d.%d" % sys.version_info[:2])
imported = [0]
for p in sys.path:
    # Scan only the standard-library tree, skipping the script directory and site-packages.
    if os.path.abspath(p).startswith(os.path.abspath(stdlib_root)) and "site-packages" not in p:
        walk([p])

print("imported %d modules" % imported[0])
if failed:
    for f in failed[:30]:
        print("FAIL " + f)
    print("FAILED %d" % len(failed))
    sys.exit(1)

# Run one representative call for each module; any exception fails the test.
calls = [
    lambda: importlib.import_module("hashlib").sha256(b"distroless").hexdigest(),
    lambda: importlib.import_module("json").dumps({"a": [1, 2.5, None, "x"]}),
    lambda: importlib.import_module("sqlite3").connect(":memory:").execute("select 1").fetchone(),
    lambda: importlib.import_module("zlib").compress(b"x" * 1000),
    lambda: importlib.import_module("bz2").compress(b"x" * 1000),
    lambda: importlib.import_module("lzma").compress(b"x" * 1000),
    lambda: importlib.import_module("ctypes").CDLL("libc.so.6"),
    lambda: importlib.import_module("base64").b64encode(b"hello"),
    lambda: importlib.import_module("uuid").uuid4().hex,
    lambda: importlib.import_module("datetime").datetime.now().isoformat(),
    lambda: importlib.import_module("collections").Counter("abracadabra")["a"],
    lambda: importlib.import_module("io").BytesIO(b"data").read(),
    lambda: importlib.import_module("struct").pack(">I", 42),
    lambda: importlib.import_module("csv").reader(["a,b"]).__next__(),
    lambda: importlib.import_module("re").match(r"\d+", "123x").group(),
    lambda: importlib.import_module("string").ascii_letters.__len__(),
    lambda: importlib.import_module("ssl").create_default_context(),
    lambda: importlib.import_module("ssl").get_default_verify_paths(),
    lambda: importlib.import_module("socket").getaddrinfo("localhost", 80),
    lambda: importlib.import_module("urllib.request").urlopen("https://example.com", timeout=10).status,
    lambda: importlib.import_module("subprocess").check_output([sys.executable, "-c", "print(1)"]).strip(),
    lambda: importlib.import_module("os").getpid(),
    lambda: importlib.import_module("math").sqrt(2),
    lambda: importlib.import_module("statistics").mean([1, 2, 3, 4]),
    lambda: importlib.import_module("fractions").Fraction(1, 3) * 3,
    lambda: importlib.import_module("calendar").isleap(2024),
    lambda: importlib.import_module("html").escape("<a>&"),
    lambda: importlib.import_module("glob").glob("/python/bin/*").__len__(),
    lambda: importlib.import_module("shutil").which(os.path.basename(sys.executable)),
    lambda: importlib.import_module("tempfile").gettempdir(),
    lambda: importlib.import_module("threading").current_thread().name,
    lambda: importlib.import_module("queue").Queue().empty(),
    lambda: importlib.import_module("concurrent.futures").ThreadPoolExecutor(max_workers=1).submit(lambda: 1).result(),
]

for i, call in enumerate(calls):
    try:
        call()
    except Exception as e:
        failed.append("call %d: %s: %s" % (i, type(e).__name__, e))

if failed:
    for f in failed:
        print("FAIL " + f)
    print("FAILED %d" % len(failed))
    sys.exit(1)

print("calls OK: %d" % len(calls))
print("ALL GOOD on Python %s (%s)" % (sys.version.split()[0], sys.platform))
