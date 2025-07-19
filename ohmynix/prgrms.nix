{ config, pkgs, ... }:

{

  # HYPRLAND
  programs.hyprland.enable = true;

  # ZSH
  programs.zsh.enable = true;

  # BIgsNARIOS EXTERNOS
  programs.nix-ld.enable = true;

}
