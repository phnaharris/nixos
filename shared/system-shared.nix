{ pkgs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../configs/tmux/tmux.conf;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      Policy = {
        AutoEnable = true;
      };
    };
  };

  # DNS
  networking.nameservers = [
    "94.140.14.14"
    "94.140.15.15"
    "1.1.1.1"
    "8.8.8.8"
    "8.8.4.4"
  ];

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    bc
    dig
    git
    git-lfs
    htop
    openssh
    ripgrep
    rsync
    unzip
    uutils-coreutils-noprefix
    wget
    tree
    zip
  ];
}
