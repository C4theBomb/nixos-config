{ lib, ... }: {
    imports = [
        ./base.nix

        ./editors
        ./shell

        ./desktop-applications.nix
        ./languages.nix
    ];

    desktop-applications.enable = lib.mkDefault true;
    languages.enable = lib.mkDefault true;
}
