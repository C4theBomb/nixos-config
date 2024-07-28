{ pkgs, modulesPath, ... }: {
    imports = [
        "${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix"
    ];

    environment.systemPackages = with pkgs; [
        neovim
        disko
        parted
        git
    ];

    docker.enable = false;
    virtualbox.enable = false;

    nixpkgs.hostPlatform = "x86_64-linux";
}
