{
  config,
  lib,
  pkgs,
  modulesPath,
  nixpkgs,
  nixos-hardware,
  home-manager,
  vscode-server,
  agenix,
  myscripts,
  ...
} @ inputs: {
  imports =
    [
      nixpkgs.nixosModules.notDetected
      home-manager.nixosModules.home-manager
      vscode-server.nixosModules.default
      agenix.nixosModules.age
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-intel
      common-pc-ssd
    ])
    ++ [
      ../../modules/i18n.nix
      ../../modules/sound.nix
      ../../modules/ssh.nix
      ../../modules/time.nix
    ]
    ++ [
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
  };
  virtualisation.libvirtd.enable = true;
  security.polkit.enable = true;

  powerManagement.cpuFreqGovernor = "performance";

  fileSystems."/" = {
    fsType = "ext4";
    device = "/dev/disk/by-label/nixos";
  };

  fileSystems."/boot" = {
    fsType = "vfat";
    device = "/dev/disk/by-label/boot";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-label/swap";
    }
  ];

  # Additional packages
  system.stateVersion = "23.05";

  nixpkgs.overlays = [
    myscripts.overlays.default
  ];
  environment.systemPackages = with pkgs; [
    bottom
    curl
    direnv
    lsof
    sudo
    wget
    zellij
    corectrl
    seatd
  ];

  # Network
  networking = {
    hostName = "kaguya";

    useDHCP = false;
    interfaces.eno1.useDHCP = true;
  };

  # VSCode server
  services.vscode-server = {
    enable = true;
  };

  users.users.sno2wman = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
    ];
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {inherit inputs;};
  home-manager.users.sno2wman = ./home-manager/profiles/sno2wman;

  programs = {
    git = {
      enable = true;
      config = {
        safe.directory = ["/etc/nixos"];
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    starship = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
  };

  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;

    desktopManager.gnome.enable = true;
  };

  services.xrdp = {
    enable = true;
    defaultWindowManager = "startplasma-x11";
  };

  networking.firewall.allowedTCPPorts = [3389];

  nix = {
    package = pkgs.nixVersions.stable;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      builders-use-substitutes = true;
      keep-outputs = true;
      keep-derivations = true;

      trusted-users = [
        "root"
        "sno2wman"
        "nix-builder"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://sno2wman.cachix.org"
      ];
      trusted-public-keys = [
        "sno2wman.cachix.org-1:JHDNKuz+q1xthbonwirDQzMZtwPrDnwCq3wUX3kmBVU="
      ];
    };
  };
}
