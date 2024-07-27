{ pkgs, lib, config, ... }: {
    config = {
        home.packages = with pkgs; [
            curl
            wget

            (nerdfonts.override { fonts = [ "Meslo" ]; })
        ];
    };
}
