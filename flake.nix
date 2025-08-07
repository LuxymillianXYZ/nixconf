{
  description = "Luxy's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.sunset = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # change this if you're on aarch64 or other
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.users.luxymillian = { pkgs, ... }: {
            home.stateVersion = "25.05";
            programs.git.enable = true;
            home.file.".config/kitty/kitty.conf".source = ./dotfiles/config/kitty/kitty.conf;
            home.file.".config/i3/config".source = ./dotfiles/config/i3/config;
            home.file."startup.sh".source = ./dotfiles/startup.sh;
            home.file.".config/fastfetch/config.jsonc".source = ./dotfiles/config/fastfetch/config.jsonc;
            home.file.".bashrc".source = ./dotfiles/.bashrc;
            home.file."powermenu.sh".source = ./dotfiles/powermenu.sh;
            home.file.".config/polybar/config".source = ./dotfiles/config/polybar/config;
            home.file.".config/niri/config.kdl".source = ./dotfiles/config/niri/config.kdl;
            home.file.".config/waybar/config".source = ./dotfiles/config/waybar/config;
            home.file.".config/waybar/style.css".source = ./dotfiles/config/waybar/style.css;
          };
        }
      ];
    };
  };
}

