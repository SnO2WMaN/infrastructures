let
  user.sno2wman = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net";
  # system.remilia = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKmswH17NuijQFJaTiVk9QgUZGWUiQQbejtiT7mv5lNI root@remilia";
in {
  "cloudflare-global-api-key.age".publicKeys = [user.sno2wman];
  "cloudflared-tunnel-remilia.age".publicKeys = [user.sno2wman];
}
