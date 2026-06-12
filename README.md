# tldr;
Get inkcut installed to your linux OS by running the `distrobox assemble create` command below:  

```sh
distrobox assemble create \
--name inkcutEnv \
--file https://raw.githubusercontent.com/cyril279/docker-inkcut/refs/heads/main/distrobox.ini
```

This approach is distribution agnostic, and is ideal for use on immutable OS's.  
The container image contains inkcut and the python environment that is needed to run it.  
The distrobox command downloads that container image then makes inkcut conveniently launchable from the OS like any other application.

### Github container registry address:
```
ghcr.io/cyril279/docker-inkcut:latest
```

### distrobox/distroshelf:
The easiest

[distrobox.ini:](distrobox.ini)  
```ini
[inkcutEnv]
name=inkcutEnv
image=ghcr.io/cyril279/docker-inkcut:latest
exported_apps=inkcut
exported_bins=/usr/bin/inkcut
exported_bins_path="$HOME/.local/bin"
pull=true
replace=true
```
