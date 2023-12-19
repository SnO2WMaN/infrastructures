{...}: {
  networking.firewall.allowedTCPPorts = [
    38080
    38443
  ];

  security.acme = {
    acceptTerms = true;
    certs = {
      "api.otomadb.com" = {
        email = "me@sno2wman.net";
      };
      "images.otomadb.com" = {
        email = "me@sno2wman.net";
      };
      "imgproxy.otomadb.com" = {
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
      "api-otomadb-com" = {
        servers = {
          "0.0.0.0:30080" = {};
        };
      };
      "ixgyohn-otomadb-com" = {
        servers = {
          "0.0.0.0:30080" = {};
        };
      };
      "imgproxy-otomadb-com" = {
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
          port = 38080;
        }
        {
          addr = "0.0.0.0";
          port = 38443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "http://api-otomadb-com/";
      };
    };

    virtualHosts."images.otomadb.com" = {
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
        proxyPass = "http://ixgyohn-otomadb-com/";
      };
    };

    virtualHosts."imgproxy.otomadb.com" = {
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
        proxyPass = "http://imgproxy-otomadb-com/";
      };
    };
  };
}
