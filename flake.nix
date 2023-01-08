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
