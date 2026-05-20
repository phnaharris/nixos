{ config, pkgs, ... }:
{
  # imports = [ ../modules ]; # Imports all app modules automatically
  config = {
    home.username = "phnaharris";
    home.homeDirectory = "/home/phnaharris";
    home.stateVersion = "26.05";
    users.users.phnaharris = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "adm"
        "users"
        "wheel"
        "audio"
        "video"
      ];
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        "application/xps" = [ "org.pwmt.zathura.desktop" ];
        "application/vnd.ms-xpsdocument" = [ "org.pwmt.zathura.desktop" ];
        "image/gif" = [ "imv.desktop" ];
        "image/jpeg" = [ "imv.desktop" ];
        "image/jpg" = [ "imv.desktop" ];
        "image/png" = [ "imv.desktop" ];
        "x-scheme-handler/http" = [ "com.brave.Browser.desktop" ];
        "x-scheme-handler/https" = [ "com.brave.Browser.desktop" ];
        "text/html" = [ "com.brave.Browser.desktop" ];
        "text/plain" = [ "nvim.desktop" ];
      };
    };

    # Auto mounting
    services.udiskie.enable = true; # USB

    # Fonts
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      public-sans
    ];
  };
}
