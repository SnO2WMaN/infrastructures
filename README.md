# servers@SnO2WMaN

![example workflow](https://github.com/SnO2WMaN/my-servers-nixos-configurations/actions/workflows/nixos/badge.svg)

## remilia



### Build

```
nixos-rebuild build --flake ".#remilia"
```
 
### Switch

```
nixos-rebuild switch --flake ".#remilia" --use-remote-sudo
```
