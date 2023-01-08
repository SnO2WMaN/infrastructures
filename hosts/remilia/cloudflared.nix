{config, ...}: {
  age.secrets."cloudflared-tunnel-remilia".file = ../../secrets/cloudflared-tunnel-remilia.age;

  services.cloudflared = {
    enable = true;
    tunnels = {
      "5dc0023b-5c8f-4ddd-978a-1f25d7439352" = {
        default = "http_status:404";
        credentialsFile = config.age.secrets.cloudflared-tunnel-remilia.path;
        ingress = {
          "ssh.sno2wman.net" = "ssh://localhost:22";
        };
      };
    };
  };
}
