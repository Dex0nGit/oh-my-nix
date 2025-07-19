{ pkgs, zenBrowserBeta, ... }:

let
  unstable = import <nixpkgs-unstable> {
    config.allowUnfree = true;
  };
in

{
  # UNFREE-PKGS
  #nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # SYSTEM

    btop
    wget
    git
    lazygit
    zsh
    mesa
    xdg-utils
    temurin-bin
    javaPackages.openjfx21
    vulkan-tools
    gcc
    flatpak
    unzip
    rustup
    rustc
    cargo
    lua
    python3
    python312Full
    nodejs_20
    gh-copilot
    ruff
    polkit
    wineWowPackages.waylandFull
    vimPlugins.nvim-treesitter
    pkgs.nerd-fonts.jetbrains-mono
    direnv
    coqPackages.vscoq-language-server
    fastfetch
    mpv
    libnotify
    bibata-cursors
    steam-devices-udev-rules
    xdg-desktop-portal-gtk
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtimageformats
    libsForQt5.qt5.qtmultimedia
    kdePackages.qt5compat

    # APPS

    spotify
    yazi
    obs-studio
    neovim
    discord
    waydroid
    vscodium-fhs
    zenBrowserBeta
    gimp3-with-plugins
    olive-editor
    osu-lazer

    # HYPRLAND

    xdg-desktop-portal-hyprland
    hyprland
    hyprpaper
    hyprlock
    kitty
    rofi
    waybar
    mako
    grim
    slurp
    wlogout
    wl-clipboard
    wlr-randr
    playerctl

  ];
}
