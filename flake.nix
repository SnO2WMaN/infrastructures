{
  # main
  inputs = {
    agenix.url = "github:ryantm/agenix";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    myscripts.url = "github:SnO2WMaN/scripts.nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    stylix.url = "github:danth/stylix";
    vscode-server.url = "github:msteen/nixos-vscode-server";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    {
      nixosConfigurations = import ./nixos/hosts inputs;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = with inputs; [
            devshell.overlays.default
            agenix.overlays.default
          ];
        };
      in {
        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            agenix
            alejandra
            direnv
            httpie
            jq
            kustomize
            sops
            taplo-cli
            treefmt
            yq
          ];
        };
      }
    );
}
