{pkgs, ...}: {
    programs.yazi.settings = {
        open.rules = [
            {
                mime = "text/*";
                use = ["text" "reveal"];
            }
            {
                mime = "image/*";
                use = ["image" "reveal"];
            }
            {
                mime = "video/*";
                use = ["video" "reveal"];
            }
            {
                mime = "application/json";
                use = ["json" "reveal"];
            }
            {
                mime = "application/pdf";
                use = ["pdf" "reveal"];
            }
            {
                mime = "*";
                use = ["text" "reveal"];
            }
        ];
        opener = {
            text = [
                {
                    run = ''nvim "$@" '';
                    for = "linux";
                }
            ];
            json = [
                {
                    run = ''jq "$@"'';
                    for = "linux";
                }
            ];
            pdf = [
                {
                    run = ''zathura "$@"'';
                    for = "linux";
                }
            ];
            image = [
                {
                    run = ''imv "$@" '';
                    block = true;
                    for = "linux";
                }
            ];
            video = [
                {
                    run = ''mpv "$@" '';
                    block = true;
                    for = "linux";
                }
            ];
            reveal = [
                {
                    run = ''${pkgs.exiftool}/bin/exiftool "$1";'';
                    block = true;
                }
            ];
        };
    };
}
