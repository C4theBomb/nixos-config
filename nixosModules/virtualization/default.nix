{ lib, ... }: {
    imports = [
        ./docker.nix
        ./virtualization
    ];

    docker.enable = lib.mkDefault true;
    virtualization.enable = lib.mkDefault true;
}
