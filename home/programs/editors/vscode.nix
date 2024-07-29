{ lib, config, ... }: {
    options = {
        vscode.enable = lib.mkEnableOption "enables VSCode";
    };

    config = lib.mkIf config.vscode.enable {
        programs.vscode = {
            enable = true;
        };
    };
}
