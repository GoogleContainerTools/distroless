# Existing
Docs: https://docs.microsoft.com/en-us/dotnet/core/install/linux-debian#dependencies

- in base
  - ca-certificates
  - tzdata
  - libc6
  - libssl1.1
  - openssl
- in cc
  - libgomp1
  - libstdc++6
  - libgcc-s1

## Analysis of mcr.microsoft.com/dotnet/runtime:6.0-bullseye-slim
```shell
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libdbgshim.so
    libdbgshim.so => ./shared/Microsoft.NETCore.App/6.0.1/libdbgshim.so (interpreter => none)
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+   librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+   ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Native.so
    libSystem.Native.so => ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Native.so (interpreter => none)
+   librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1
+       libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+           ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libclrjit.so
    libclrjit.so => ./shared/Microsoft.NETCore.App/6.0.1/libclrjit.so (interpreter => none)
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+   librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+   ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Security.Cryptography.Native.OpenSsl.so
    libSystem.Security.Cryptography.Native.OpenSsl.so => ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Security.Cryptography.Native.OpenSsl.so (interpreter => none)
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+       ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
+   libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libSystem.IO.Compression.Native.so
    libSystem.IO.Compression.Native.so => ./shared/Microsoft.NETCore.App/6.0.1/libSystem.IO.Compression.Native.so (interpreter => none)
-   libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 // TODO: zlib1g
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+       ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libhostpolicy.so
libhostpolicy.so => ./shared/Microsoft.NETCore.App/6.0.1/libhostpolicy.so (interpreter => none)
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+   ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libmscordaccore.so
    libmscordaccore.so => ./shared/Microsoft.NETCore.App/6.0.1/libmscordaccore.so (interpreter => none)
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+   librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+   ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libcoreclr.so
    libcoreclr.so => ./shared/Microsoft.NETCore.App/6.0.1/libcoreclr.so (interpreter => none)
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+   librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+   ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Net.Security.Native.so
    libSystem.Net.Security.Native.so => ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Net.Security.Native.so (interpreter => none)
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+       ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Globalization.Native.so
    libSystem.Globalization.Native.so => ./shared/Microsoft.NETCore.App/6.0.1/libSystem.Globalization.Native.so (interpreter => none)
+   libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+       ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libmscordbi.so
    libmscordbi.so => ./shared/Microsoft.NETCore.App/6.0.1/libmscordbi.so (interpreter => none)
+   libmscordaccore.so => ./shared/Microsoft.NETCore.App/6.0.1/libmscordaccore.so
+       libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
+       librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1
+       libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
+   ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
$ lddtree ./shared/Microsoft.NETCore.App/6.0.1/libcoreclrtraceptprovider.so
    libcoreclrtraceptprovider.so => ./shared/Microsoft.NETCore.App/6.0.1/libcoreclrtraceptprovider.so (interpreter => none)
/   liblttng-ust.so.0 => not found
+   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
+       ld-linux-x86-64.so.2 => /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
+   libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
+   libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
+   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
```
