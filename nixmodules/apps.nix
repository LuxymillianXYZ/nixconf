{ config, lib, pkgs, ... }:

let
  myOBS = pkgs.obs-studio.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.ffmpeg-full ];
  });
in

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  programs.firefox.enable = true;

  programs.niri.enable = true;
  programs.xwayland.enable = true;

 # List packages installed in system profile.
 # You can use https://search.nixos.org/ to find more packages (and options).
  nixpkgs.config.allowUnfree = true;
  
  services.dbus.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    vscodium
    fastfetch
    discord
    steam
    lxsession
    rofi
    (polybar.override {
      i3Support = true;
    })
    nitrogen
    git
    xfce.xfce4-settings
    xfce.thunar
    pavucontrol
    picom
    nordic
    papirus-icon-theme
    flatpak
    libnotify
    prismlauncher
    pinta
    xdotool
    myOBS
    ffmpeg-full
    font-awesome
    kdePackages.kdenlive
    jdk24
    copyq
    cava
    htop
    cmatrix
    rivalcfg
    feh
    peazip
    python312Packages.pip
    python312Packages.python
    python312Packages.virtualenv
    python312Packages.manim
    eza
    tealdeer
    man
    jetbrains-toolbox
    localsend
    ninja
    meson
    gcc
    pkg-config
    cmake
    pango
    glib
    gobject-introspection-unwrapped
    bottles
    caligula
    yazi
    mako
    waybar
    xwayland-satellite
    swaybg
    fuzzel
    hyprpaper
    lxappearance
    hyprshot
    eww
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];


  

  xdg.portal.enable = true;
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  # or pkgs.xdg-desktop-portal-kde if you use KDE Plasma
  ];

  virtualisation.virtualbox.host.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [ virtualbox ];  

  

  
  environment.variables = {
    XDG_DATA_DIRS = lib.mkForce ''
      /var/lib/flatpak/exports/share:/nix/store/ml6yp8dpgcxgggf9akyhr1w19ifdhq0q-xfce4-settings-4.20.1/share:/nix/store/x0x7k51kfxnd6v0cyxln73pqzq2lmcl8-gsettings-desktop-schemas-48.0/share/gsettings-schemas/gsettings-desktop-schemas-48.0:/nix/store/6x7s7vfydrik42pk4599sm1jcqxmi1qp-gtk+3-3.24.49/share/gsettings-schemas/gtk+3-3.24.49:/nix/store/xqv8g80ggw4swpmfd1wwxjg4m8i157ra-colord-1.4.6/share/gsettings-schemas/colord-1.4.6:/nix/store/81f2pmz7y9jz2xdh44wg4cycc6q8wlac-xfce4-session-4.20.2/share:/nix/store/x0x7k51kfxnd6v0cyxln73pqzq2lmcl8-gsettings-desktop-schemas-48.0/share/gsettings-schemas/gsettings-desktop-schemas-48.0:/nix/store/6x7s7vfydrik42pk4599sm1jcqxmi1qp-gtk+3-3.24.49/share/gsettings-schemas/gtk+3-3.24.49:/nix/store/fv015nsbqlsnbyxm1q7c441vcgx3q0dc-desktops/share:/home/luxymillian/.nix-profile/share:/nix/profile/share:/home/luxymillian/.local/state/nix/profile/share:/etc/profiles/per-user/luxymillian/share:/nix/var/nix/profiles/default/share:/run/current-system/sw/share
    '';
    
    PATH = lib.mkForce ''
      /run/wrappers/bin:/home/luxymillian/.nix-profile/bin:/nix/profile/bin:/home/luxymillian/.local/state/nix/profile/bin:/etc/profiles/per-user/luxymillian/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/nix/store/ch2v48p4ip1dh12iw265sxnj40jh38xc-kitty-0.42.1/bin:/nix/store/w9393s0xnbdy4v0dqlb1i5iv305bdnz9-imagemagick-7.1.1-47/bin:/nix/store/c4ibx1x2y2xn21zij6nnpcmnrclp58wq-ncurses-6.5-dev/bin:/var/lib/flatpak/exports/bin:/home/luxymillian/.nix-profile/bin:/nix/profile/bin:/home/luxymillian/.local/state/nix/profile/bin:/etc/profiles/per-user/luxymillian/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/nix/store/ch2v48p4ip1dh12iw265sxnj40jh38xc-kitty-0.42.1/bin:/nix/store/w9393s0xnbdy4v0dqlb1i5iv305bdnz9-imagemagick-7.1.1-47/bin:/nix/store/c4ibx1x2y2xn21zij6nnpcmnrclp58wq-ncurses-6.5-dev/bin
    '';
  };
}
