{
  config,
  pkgs,
  ...
}: {
  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [];

  users.users.sno2wman.extraGroups = ["docker"];
}
