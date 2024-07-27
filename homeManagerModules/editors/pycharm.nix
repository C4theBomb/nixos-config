{ pkgs, lib, config, ... }: {
    options = {
        pycharm.enable = lib.mkEnableOption "enables Pycharm";
    };

    config = lib.mkIf config.pycharm.enable {
        home.packages = with pkgs; [ jetbrains.pycharm-professional ];
        home.file = {
            ".ideavimrc".source = dotfiles/ideavimrc;
        };
    };
}
