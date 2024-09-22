{ pkgs, lib, inputs, ... }: {
    imports = [
        ../..
		./hardware-configuration.nix

		inputs.nixos-hardware.nixosModules.raspberry-pi-4
    ];

    networking.hostName = "chibi";

    users.users.c4patino = {
        isNormalUser = true;
        description = "C4 Patino";
        extraGroups = [ "networkmanager" "wheel" "vboxusers" "docker" ];
        initialPassword = "passw0rd";
        shell = pkgs.zsh;
    };
    programs.zsh.enable = true;

	# network-manager.enable = true;
	#
	# docker.enable = true;
	#
    # github-runners.enable = true;
	# tailscale.enable = true;
	# nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
