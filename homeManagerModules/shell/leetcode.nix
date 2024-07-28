{ pkgs, lib, config, inputs, ... }: {
    options = {
        leetcode.enable = lib.mkEnableOption "enables leetcode";
    };

    config = lib.mkIf config.leetcode.enable {
        home.packages = with pkgs; [ leetcode-cli ];

        home.file = {
            ".leetcode/leetcode.toml".source = inputs.dotfiles + "leetcode.toml";
        };
    };
}
