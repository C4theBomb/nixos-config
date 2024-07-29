{ lib, config, ... }: {
    options = {
        git.enable = lib.mkEnableOption "enables git";
    };

    config = lib.mkIf config.git.enable {
        programs.git = {
            enable = true;
            lfs.enable = true;
            userName = "C4 Patino";
            userEmail = "c4patino@gmail.com";

            extraConfig = {
                user.signingkey = "~/.ssh/github.pub";
                init.defaultBranch = "main"; 
                pull.rebase = true; 
                fetch.prune = true; 

                maintenance.auto = true; 
                core.editor = "nvim"; 
                commit.gpgsign = true;
                gpg.format = "ssh"; 
                diff.colorMoved = "zebra";
            };
        };
    };
}
