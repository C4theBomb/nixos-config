{
  pkgs ?
    import <nixpkgs> {
      config = {
        allowUnfree = true;
        cudaSupport = true;
      };
    },
  enableTensorflow ? false,
  enablePyTorch ? false,
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    poetry

    python312Full
    python312Packages.virtualenv
    python312Packages.debugpy

    (
      if enableTensorflow
      then python312Packages.tensorflowWithCuda
      else null
    )
    (
      if enableTensorflow
      then (python312Packages.keras.override {tensorflow = python312Packages.tensorflowWithCuda;})
      else null
    )

    (
      if enablePyTorch
      then python312Packages.torchvision
      else null
    )
    (
      if enablePyTorch
      then python312Packages.torchaudio
      else null
    )

    # Won't actually use the matplotlib installed here, but needed to set up environment
    python312Packages.matplotlib

    # Won't actually use the OpenCV installed here, but this sets up env vars
    (python312Packages.opencv4.override {enableGtk3 = true;})
  ];

  shell = pkgs.zsh;

  shellHook = ''
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.libGL}/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.glib.out}/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.stdenv.cc.cc.lib}/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/opengl-driver/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NIX_LD_LIBRARY_PATH
  '';
}
