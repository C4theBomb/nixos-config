{ lib, ... }: {
    imports = [
        ./docker.nix
        ./virtualbox.nix
    ];

    docker.enable = lib.mkDefault true;
    virtualbox.enable = lib.mkDefault true;
}
