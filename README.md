# tldr;
Get inkcut installed to your linux OS by running the `distrobox create` command below:  

```sh
distrobox create \
  --name inkcutEnv \
  --image ghcr.io/cyril279/docker-inkcut:latest \
  --home "$HOME/.local/share/distrobox/inkcutEnv" \
  --export-apps "/opt/inkcut-env/share/applications/inkcut.desktop" \
  --export-binaries "/opt/inkcut-env/bin/inkcut" \
  --export-binaries-path "$HOME/.local/bin" \
  --pull \
  --replace
```

# Overview
1. A github action builds an OCI image that contains [inkcut](https://github.com/inkcut/inkcut/tree/master) and a python environment to run it.  
2. The distrobox command above  
    - Downloads that image and integrates it with the host machine.  
    - Makes inkcut conveniently launchable from the OS like any other application.  

This approach is distribution agnostic, and is ideal for use on immutable OS's.  

### Github container registry address:
```
ghcr.io/cyril279/docker-inkcut:latest
```

# distrobox-assemble create
The declaritive approach; The paths and flags and such are stored in a file, and you simply point the distrobox-assemble command to use that configuration.
```sh
distrobox assemble create \
--name inkcutEnv \
--file https://raw.githubusercontent.com/cyril279/docker-inkcut/refs/heads/main/distrobox.ini
```

[distrobox.ini:](distrobox.ini)  
```ini
[inkcutEnv]
name=inkcutEnv
image=ghcr.io/cyril279/docker-inkcut:latest
home=$HOME/.local/share/distrobox/inkcutEnv
exported_apps=/opt/inkcut-env/share/applications/inkcut.desktop
exported_bins=/opt/inkcut-env/bin/inkcut
exported_bins_path="$HOME/.local/bin"
pull=true
replace=true
```

# todo:
Document the serial-permissions hurdles  