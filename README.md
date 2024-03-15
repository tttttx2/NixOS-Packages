# README
This repo is inspired by https://gitlab.inria.fr/nix-tutorial/packages-repository and contains software that I haven't figured out how to properly package yet. It's whatever, but kinda works...


## Install package from this repo
change your configuration.nix to something like this:
```
{ config, pkgs, ... }:
let
  tttttx2 = import (fetchTarball https://github.com/tttttx2/NixOS-Packages/archive/main.tar.gz) {};
in
{
environment.systemPackages = [
  tttttx2.mito
];
}
```
