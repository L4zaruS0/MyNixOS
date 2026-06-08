# MyNixOS
My first NixOS configuration and rice
## Installation
Assuming that you have already booted into NixOS, you must follow next steps:
  1. Clone this rep
```
git clone https://github.com/L4zaruS0/MyNixOS.git
```
If you see 

>aborted: disko config must be an existing file or flake must be set
>
You can just 'cd MyNixOS' and try again
  2. Disk Partitioning
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./disko.nix
```
  3. Generate hardware config
```
nixos-generate-config --root /mnt
```
  4. Install everything 
```
nixos-install --flake
```
