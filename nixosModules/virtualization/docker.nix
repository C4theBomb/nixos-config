{ pkgs, lib, config, ... }: {
    options = {
        docker.enable = lib.mkEnableOption "enables docker";
    };

    config = lib.mkIf config.docker.enable {
        virtualisation = {
            docker = {
                enable = true;
                rootless = {
                    enable = true;
                    setSocketVariable = true;
                };
            };
        };
    };
}

