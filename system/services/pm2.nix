{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pm2.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable pm2";
    };
  };

  config = lib.mkIf config.pm2.enable {
    environment.systemPackages = with pkgs; [
      pm2
    ];

    systemd.services.pm2 = {
      enable = true;
      description = "pm2";
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        User = config.users.users.c4patino.name;
        Group = config.users.users.c4patino.group;
        ExecStart = "${pkgs.pm2}/bin/pm2 resurrect --no-daemon";
        ExecReload = "${pkgs.pm2}/bin/pm2 reload all";
        ExecStop = "${pkgs.pm2}/bin/pm2 kill";
      };
      environment = {
        HOME = config.users.users.c4patino.home;
      };
    };
  };
}
