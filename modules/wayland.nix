{ pkgs, ... }:
{
  # Install your Wayland compositor and desktop utilities
  home.packages = with pkgs; [
    grim
    slurp
    swappy
    imv
    mpv
    zathura
    wl-clipboard
    wlr-randr
  ];

  programs.waybar.enable = true;
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [ rofi-calc ];
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "phnaharris";
      };
      default_session = initial_session;
    };
  };
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      font = "Public Sans 12";
      background-color = "#222222";
      text-color = "#d5c4a1";
      border-color = "#555555";
      "urgency=low" = {
        background-color = "#2c2826";
        text-color = "#b6aca4";
      };
      "urgency=critical" = {
        text-color = "#ebdbb2";
        border-color = "#fb4934";
      };
    };
  };

  # Security for GUI session
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    swaylock.enableGnomeKeyring = true;
  };
  security.rtkit.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 16;
    gtk.enable = true;
    sway.enable = true;
  };

  # Symlink your raw, native Wayland config files from your repo
  xdg.configFile = {
    "sway".source = ../configs/sway;
    "waybar".source = ../configs/waybar;
  };

  # Screen sharing
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = "wlr";
      };
    };
    wlr.enable = true;
    wlr.settings.screencast = {
      chooser_type = "simple";
      chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
    };
  };

  # Input
  services.libinput.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # No X11
  services.xserver.enable = false;
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}
