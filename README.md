# README
This repo is inspired by https://gitlab.inria.fr/nix-tutorial/packages-repository and contains software that I haven't figured out how to properly package yet...


## Add channel
```
nix-channel --add https://github.com/tttttx2/NixOS-Packages/archive/main.tar.gz tttttx2
```
change your configuration.nix to something like this:
```
let tttttx2 = import tttttx2 { inherit pkgs; }; in
environment.systemPackages = [
  tttttx2.mito
];
```
or 
```
let tttttx2 = import (builtins.fetchTarball {"https://github.com/tttttx2/NixOS-Packages/archive/main.tar.gz"}) {}
environment.systemPackages = [
  tttttx2.mito
];
```
