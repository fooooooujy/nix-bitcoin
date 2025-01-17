{ pkgs ? import <nixpkgs> {} }:
{
  # 'lib', 'modules' and 'overlays' are special, see
  # https://github.com/nix-community/NUR for more.
  modules = import ./modules; # NixOS modules

  nodeinfo = pkgs.callPackage ./pkgs/nodeinfo { };
  lightning-charge = pkgs.callPackage ./pkgs/lightning-charge { };
  nanopos = pkgs.callPackage ./pkgs/nanopos { };
  spark-wallet = pkgs.callPackage ./pkgs/spark-wallet { };
  electrs = (pkgs.callPackage ./pkgs/electrs { }).rootCrate.build;
  elementsd = pkgs.callPackage ./pkgs/elementsd { withGui = false; };
  hwi = pkgs.callPackage ./pkgs/hwi { };
  pylightning = pkgs.python3Packages.callPackage ./pkgs/pylightning { };
  liquid-swap = pkgs.python3Packages.callPackage ./pkgs/liquid-swap { };
}
