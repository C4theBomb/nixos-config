{ lib, ... }: {
    imports = [
        ./neovim.nix
        ./idea.nix
        ./pycharm.nix
        ./vscode.nix
    ];

    neovim.enable = lib.mkDefault true;
    idea.enable = lib.mkDefault true;
    pycharm.enable = lib.mkDefault true;
    vscode.enable = lib.mkDefault false;
}
