inputs: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  remilia = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [./remilia];
  };
  kaguya = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [./kaguya];
  };
}
