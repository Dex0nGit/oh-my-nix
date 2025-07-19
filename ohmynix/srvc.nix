{ config, pkgs, ... }:

{
  # SERVICES

  # Flatpak
  services.flatpak.enable = true;

  # DBUS
  services.dbus.enable = true;

  # MAKO
  # services.mako.enable = true;

  # GNOME AUTO LOGIN
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # AUTO-LOGIN
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "dex";

  # XDG-DESKTOP-PORTAL
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # X11
  services.xserver.enable = true;

  # GNOME
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # KEYMAP
  services.xserver.xkb = {
    layout = "br";
    variant = "thinkpad";
  };

  # T-KEYMAP
  console.keyMap = "br-abnt2";

  # CUPS
  services.printing.enable = true;

  # PIPEWIRE
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
