{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-linux" "x86_64-linux" ];
      perSystem = { config, pkgs, ... }: {
        packages.default = pkgs.qt6Packages.callPackage ./build.nix { };
        devShells.default = pkgs.mkShell {
          inputsFrom = [ config.packages.default ];
          buildInputs = with pkgs; [
            gdb
            qtcreator

            # this is for the shellhook portion
            qt6.wrapQtAppsHook
            makeWrapper
            bashInteractive
          ];
          # set the environment variables that unpatched Qt apps expect
          shellHook = ''
            bashdir=$(mktemp -d)
            makeWrapper "$(type -p bash)" "$bashdir/bash" "''${qtWrapperArgs[@]}"
            exec "$bashdir/bash"
          '';
        };
      };
    };
}
