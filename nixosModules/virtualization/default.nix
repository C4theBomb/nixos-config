{ lib, ... }: {
    imports = [
        ./docker.nix
        ./virtualbox.nix
        ./teamviewer.nix
    ];

    docker.enable = lib.mkDefault true;
    virtualbox.enable = lib.mkDefault true;
    teamviewer.enable = lib.mkDefault true;
}
