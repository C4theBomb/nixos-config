{ lib, config, inputs, ... }: {
    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable {
        home.packages = with pkgs; [ ripgrep ];

        programs.neovim = {
            enable = true;
            defaultEditor = true;

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;
        };

        xdg.configFile.nvim = {
            source = inputs.neovim-config;
            recursive = true;
        };
    };
}
