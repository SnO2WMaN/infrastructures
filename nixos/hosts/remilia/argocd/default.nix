{...}: {
  networking.firewall.allowedTCPPorts = [
    38080
    38443
  ];

  security.acme = {
    acceptTerms = true;
    certs = {
      "argocd.sno2wman.net" = {
        email = "me@sno2wman.net";
      };
    };
  };

  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    upstreams = {
      "argocd-sno2wman-net" = {
        servers = {
          "0.0.0.0:30080" = {};
        };
      };
    };

    virtualHosts."argocd.sno2wman.net" = {
      enableACME = true;
      forceSSL = true;
      listen = [
        {
          addr = "0.0.0.0";
          port = 38080;
        }
        {
          addr = "0.0.0.0";
          port = 38443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "http://argocd-sno2wman-net/";
      };
    };
  };
}
