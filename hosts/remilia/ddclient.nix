{config, ...}: {
  age.secrets."cloudflare-global-api-key".file = ../../secrets/cloudflare-global-api-key.age;

  services.ddclient = {
    enable = true;
    protocol = "cloudflare";

    zone = "sno2wman.net";
    domains = [
      "p.sno2wman.net"
    ];
    username = "me@sno2wman.net";
    passwordFile = config.age.secrets.cloudflare-global-api-key.path;
  };
}
