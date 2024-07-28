{ lib, ... }: {
    imports = [
        ./git.nix
        ./ssh.nix
        ./zoxide.nix
        ./zsh.nix
        ./gh.nix
        ./kitty.nix
        ./leetcode.nix
    ];

    git.enable = lib.mkDefault true;
    gh.enable = lib.mkDefault true;
    ssh.enable = lib.mkDefault true;
    zoxide.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    leetcode.enable = lib.mkDefault true;
}
