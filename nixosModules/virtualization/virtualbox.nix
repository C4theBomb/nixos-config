{ pkgs, lib, config, ... }: {
    options = {
        virtualbox.enable = lib.mkEnableOption "enables virtualbox";
    };

    config = lib.mkIf config.virtualbox.enable {
        virtualisation = {
            virtualbox.host = {
                enable = true;
                enableExtensionPack = true;
            };
        };
    };
}
