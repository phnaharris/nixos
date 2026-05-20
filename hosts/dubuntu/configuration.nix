{ pkgs, ... }:
{
  imports = [
    ../../shared/system-shared.nix
    ../../modules/laptop.nix
  ];

  networking.hostName = "dixos";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Intel-specific graphics drivers
  # hardware.graphics.extraPackages = with pkgs; [
  #   intel-compute-runtime-legacy1
  #   intel-vaapi-driver
  #   libva-vdpau-driver
  # ];
}
