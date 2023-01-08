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
  arion,
  ...
}: {
  imports =
    [
      nixpkgs.nixosModules.notDetected
      home-manager.nixosModules.home-manager
      vscode-server.nixosModules.default
      agenix.nixosModules.age
      arion.nixosModules.arion
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-pc-ssd
    ])
    ++ [
      ../../modules/ssh.nix
      ../../modules/i18n.nix
      ../../modules/time.nix
      ../../modules/docker.nix
    ]
    ++ [
      ./otomadb
      # ./ddclient.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
    ];

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
    device = "/dev/disk/by-uuid/ef92c7d4-ad47-4806-a622-4f2abd562ca2";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DAAD-07F4";
    fsType = "vfat";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/0afb4061-d95c-49d8-b41e-6458a55ac11f";
    }
  ];

  # Additional packages
  system.stateVersion = "23.05";

  nix.settings.max-jobs = lib.mkDefault 32;

  environment.systemPackages = with pkgs; [
    direnv
    wget
    sudo
    curl
    bottom
    zellij
  ];

  # Network
  networking = {
    hostName = "remilia";

    useDHCP = false;
    interfaces.enp1s0f1.useDHCP = true;
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
      "libvirtd"
      "kvm"
    ];
  };
  home-manager.users.sno2wman = import ./home-manager/profiles/sno2wman;

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
  };
}
