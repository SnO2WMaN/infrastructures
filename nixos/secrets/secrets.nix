let
  system.remilia = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEzlJWDvPcxlx7fv4iFAWxIMGynJ/zIWo5BGNqp24pzU root@remilia";
  user.sno2wman = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net";
in {
  "cloudflare-global-api-key.age".publicKeys = [system.remilia user.sno2wman];
  "cloudflared/tunnels/remilia.age".publicKeys = [system.remilia user.sno2wman];
}
