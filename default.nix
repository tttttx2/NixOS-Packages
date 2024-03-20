{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  packages = rec {
    mito = callPackage ./pkgs/mito {};
    easytax_ag_2023 = callPackage ./pkgs/easytax_ag_2023 {};

    inherit pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
  };
in
  packages

