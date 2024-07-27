{ pkgs, lib, config, ... }: {
    options = {
        idea.enable = lib.mkEnableOption "enables IntelliJ IDEA";
    };

    config = lib.mkIf config.idea.enable {
        home.packages = with pkgs; [ jetbrains.idea-ultimate ];
        home.file = {
            ".ideavimrc".source = dotfiles/ideavimrc;
        };
    };
}
