{ pkgs, lib, config, inputs, ... }: {
    home.packages = with pkgs; [ nvtopPackages.nvidia ];
}
