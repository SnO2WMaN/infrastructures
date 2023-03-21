{
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [6443];

  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = "--write-kubeconfig-mode 644";
  };

  environment.systemPackages = with pkgs; [
    kubectl
    kubernetes-helm
  ];
}
