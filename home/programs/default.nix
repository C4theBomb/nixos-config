{ lib, ... }: {
    imports = [
        ./anyrun
        ./editors
        ./eww
        ./media
        ./terminal

        ./desktop-applications.nix
        ./languages.nix
        ./browsers.nix
    ];

    google-chrome.enable = lib.mkDefault true;
    desktop-applications.enable = lib.mkDefault true;
    languages.enable = lib.mkDefault true;
}
