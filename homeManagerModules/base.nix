{ pkgs, lib, config, ... }: {
    config = {
        home.packages = with pkgs; [
            curl
            wget
            xclip

            (nerdfonts.override { fonts = [ "Meslo" ]; })
        ];
    };
}
