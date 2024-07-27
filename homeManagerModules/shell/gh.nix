{ pkgs, lib, config, ... }: {
    options = {
        gh.enable = lib.mkEnableOption "enables gh";
    };

    config = lib.mkIf config.gh.enable {
        programs.gh = {
            enable = true;
            extensions = with pkgs; [ github-copilot-cli ];
        };
    };
}
