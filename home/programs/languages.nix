{ pkgs, lib, config, ... }: {
    options = {
        languages.enable = lib.mkEnableOption "enables languages";
    };

    config = lib.mkIf config.languages.enable {
        home.packages = with pkgs; [
            conda
            gcc
            python3
            nodejs_22
            maven
            go
        ];

        programs.java.enable = true;
    };
}
