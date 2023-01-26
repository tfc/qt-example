{ system ? builtins.currentSystem }:

let
  flakeCompat = import ./nix/flake-compat.nix { src = ./.; inherit system; };
  thisFlake = flakeCompat.allNodes.root;
in

{
  devShell = thisFlake.devShells.${system}.default;
  app = thisFlake.packages.${system}.default;
}
