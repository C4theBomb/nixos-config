{ pkgs, lib, config, ... }: {
    options = {
        desktop-applications.enable = lib.mkEnableOption "enables desktop-applications";
    };

    config = lib.mkIf config.desktop-applications.enable {
        home.packages = with pkgs; [
            (google-chrome.override {
                commandLineArgs = [ "--enable-features=UseOzonePlatform" "--ozone-platform=wayland" ];
            })
            spotify
            webcord
            slack
            zoom-us
            variety
            obs-studio
            postman
            mongodb-compass

            libreoffice-qt
            hunspell
            hunspellDicts.en_US
        ];
    };
}
