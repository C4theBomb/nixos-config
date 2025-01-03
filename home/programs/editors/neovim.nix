{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    neovim.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable neovim";
    };
  };

  config = lib.mkIf config.neovim.enable {
    home.packages = [
      inputs.nixvim-config.packages.${pkgs.system}.default
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
