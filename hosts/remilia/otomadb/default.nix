{...}: {
  networking.firewall.allowedTCPPorts = [
    8080
    8443
  ];

  security.acme = {
    acceptTerms = true;
    certs = {
      "api.otomad-database.sno2wman.net" = {
        email = "me@sno2wman.net";
        # listenHTTP = ":8080";
        # dnsProvider = "cloudflare";
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
      "api-otomadb" = {
        servers = {
          "0.0.0.0:4000" = {};
        };
      };
    };

    virtualHosts."api.otomad-database.sno2wman.net" = {
      enableACME = true;
      forceSSL = true;
      listen = [
        {
          addr = "0.0.0.0";
          port = 8080;
        }
        {
          addr = "0.0.0.0";
          port = 8443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "http://api-otomadb/";
      };
    };
  };
}
