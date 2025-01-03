{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../..
    ./hardware-configuration.nix

    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];

  networking.hostName = "chibi";

  users.users.c4patino = {
    isNormalUser = true;
    description = "C4 Patino";
    extraGroups = ["networkmanager" "wheel" "docker" "syncthing"];
    initialPassword = "passw0rd";
    shell = pkgs.zsh;
  };

  network-manager.enable = true;

  docker.enable = true;

  pm2.enable = true;
  slurm.enable = true;
  syncthing.enable = true;
  tailscale.enable = true;
}
