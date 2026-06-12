# docker-inkcut
Multistage docker setup that builds inkcut then creates a trimmed-down image (no compiler stuff) with just enough to run the inkcut binaries

```
ghcr.io/cyril279/docker-inkcut:latest
```

### inkcutEnv.ini

[inkcutEnv raw url](https://raw.githubusercontent.com/cyril279/docker-inkcut/refs/heads/main/inkcutEnv.ini)
[inkcutEnv.ini](inkcutEnv.ini)  
```ini
# untested 2026/06/11
[inkcutEnv]
name=inkcutEnv
image=ghcr.io/cyril279/docker-inkcut:latest
exported_apps="inkcut"
pull=true
replace=true
```