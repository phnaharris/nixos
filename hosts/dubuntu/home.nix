{ pkgs, lib, ... }:
{
  imports = [
    ../../shared/home-shared.nix
  ];

  # GUI configuration
  home.sessionVariables = {
    BROWSER = "brave";
    XCURSOR_SIZE = "48";
    GDK_BACKEND = "wayland,x11";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  programs.alacritty.enable = true;
  programs.nvim.enable = true;
  programs.fish.enable = true;
  home.packages = with pkgs; [
    brave
    google-chrome
    firefox

    kbfs
    keybase
    signal-desktop

    gimp
    obs-studio
    pavucontrol
    pulseaudio
    yt-dlp
    zoom-us
    thunar

    libnotify
    libsecret
  ];

  xdg.configFile = {
    "alacritty" = ../../configs/alacritty;
    "nvim" = ../../configs/nvim;
    "fish" = ../../configs/fish;
  };

  # Keybase
  services.keybase.enable = true;
  services.kbfs.enable = true;
  systemd.user.services.kbfs.wantedBy = lib.mkForce [ ];

  # Printing
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

}
