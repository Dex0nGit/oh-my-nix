{
  config,
  pkgs,
  ...
}:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # MESA DRIVERS
  hardware.graphics.enable = true;

  # NIX FLAKES
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11"; # Did you read the comment?WTFFFFFFF

}
