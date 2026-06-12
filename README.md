# docker-inkcut
Multistage docker setup that builds inkcut then creates a trimmed-down image (no compiler stuff) to run the inkcut binaries

### Github container registry address:
```
ghcr.io/cyril279/docker-inkcut:latest
```

### distrobox/distroshelf from URL:
```sh
distrobox assemble create https://raw.githubusercontent.com/cyril279/docker-inkcut/refs/heads/main/inkcutEnv.ini
```

[inkcutEnv.ini](inkcutEnv.ini)  
```ini
# untested 2026/06/11
[inkcutEnv]
name=inkcutEnv
image=ghcr.io/cyril279/docker-inkcut:latest
exported_apps=inkcut
exported_bins=/usr/bin/inkcut
exported_bins_path="$HOME/.local/bin"
pull=true
replace=true
```
