{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server = {
      url = "github:msteen/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # vscode-marketplace = {
    #   url = "github:AmeerTaweel/nix-vscode-marketplace";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    yamlfmt = {
      url = "github:SnO2WMaN/yamlfmt.nix";
      inputs.devshell.follows = "devshell";
      inputs.flake-utils.follows = "flake-utils";
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    {
      nixosConfigurations = import ./hosts inputs;
      # homeConfigurations = import ./home-manager inputs;

      # overlays.default = import ./pkgs/overlay.nix;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = with inputs; [
            devshell.overlay
            agenix.overlay
            (final: prev: {
              yamlfmt = yamlfmt.packages.${system}.yamlfmt;
            })
          ];
        };
      in {
        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            direnv
            alejandra
            treefmt
            git-crypt
            taplo-cli
            agenix
            yamlfmt
          ];
          commands = [
            {
              name = "my-nixos-build";
              category = "nixos";
              command = "nixos-rebuild build --flake \".#$(hostname)\"";
            }
            {
              name = "my-nixos-switch";
              category = "nixos";
              command = "nixos-rebuild switch --flake \".#$(hostname)\" --use-remote-sudo";
            }
          ];
          # devshell.startup.pnpm_install.text = "pnpm install";
          # env = [
          #   {
          #     name = "PATH";
          #     prefix = "$PRJ_ROOT/node_modules/.bin";
          #   }
          # ];
        };
      }
    );
}
