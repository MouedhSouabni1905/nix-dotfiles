{

	description = "Kabukicho";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
	};
	
	outputs = {self, nixpkgs, ...} :
		let
			lib = nixpkgs.lib;
		in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				system = "x86-64_linux";
				modules = [ ./configuration.nix ];
			};
		};
	};

}
