# NixOS

## Memo

### Build

```
nixos-rebuild build --flake ".#remilia"
```

### Switch

```
nixos-rebuild switch --flake ".#remilia" --use-remote-sudo
```

### Agenix

```
cd secrets
agenix -e cloudflared/tunnels/remilia.age

agenix --rekey
```
