{
	pkgs ? import <nixpkgs> { config = { allowUnfree = true; cudaSupport = true; }; }, 
}: pkgs.mkShell {
    name = "rust-dev";

    nativeBuildInputs = with pkgs; [
		cargo
		rustc
		rustfmt

		gdb
    ];

    shell = pkgs.zsh;

    shellHook = ''
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.libGL}/lib
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.glib.out}/lib
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/opengl-driver/lib
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NIX_LD_LIBRARY_PATH;
    '';
}
