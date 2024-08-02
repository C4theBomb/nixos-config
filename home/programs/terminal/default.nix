{ lib, ... }: {
    imports = [
        ./yazi

        ./bat.nix
        ./bottom.nix
        ./nvtop.nix
        ./gh.nix
        ./git.nix
        ./kitty.nix
        ./leetcode.nix
        ./ssh.nix
        ./zoxide.nix
        ./zsh.nix
    ];

    git.enable = lib.mkDefault true;
    gh.enable = lib.mkDefault true;
    ssh.enable = lib.mkDefault true;
    zoxide.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    leetcode.enable = lib.mkDefault true;
}
