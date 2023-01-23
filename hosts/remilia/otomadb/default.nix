{...}: {
  networking.firewall.allowedTCPPorts = [
    8080
    8443
  ];

  security.acme = {
    acceptTerms = true;
    certs = {
      "api.otomadb.com" = {
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
      "otomadb-api" = {
        servers = {
          "0.0.0.0:30080" = {};
        };
      };
    };

    virtualHosts."api.otomadb.com" = {
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
        proxyPass = "http://otomadb-api/";
      };
    };
  };
}
