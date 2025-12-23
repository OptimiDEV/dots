{
	description = "Optimi's FLAKE-DOT-NIX OFDN";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
    oxwm = {
      url = "github:tonybanters/oxwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, home-manager, oxwm, ... }: {
		nixosConfigurations.optipxc = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
        oxwm.nixosModules.default
        {
          services.xserver = {
            enable = true;
            windowManager.oxwm.enable = true;
          };
        }
        home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							users.optimidev = import ./home.nix;
							backupFileExtension = "backup";
						};
					}
			];
		};
	};

}
