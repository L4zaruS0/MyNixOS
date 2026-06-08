# MyNixOS
My first NixOS configuration and rice
## Installation
Assuming that you have already booted into NixOS, you must follow next steps:
  1. Clone this rep
```
git clone https://github.com/L4zaruS0/MyNixOS.git
```
  2. Disk Partitioning
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./disko.nix
```

If you see 

>aborted: disko config must be an existing file or flake must be set

You can just `cd MyNixOS` and try again

  3. Generate hardware config
```
nixos-generate-config --root /mnt
```
It's recommended to copy it to 'MyNixOS' folder 
If you already done `cd MyNixOS` you should proceed with:
```
cp /mnt/etc/nixos/hardware-configuration.nix .
```
  4. Install everything 
```
nixos-install --flake .#L
```

If you see

> error path '/mnt/nix/store/.../hardware-configuration.nix' does not exist

do:
```
git add hardware-configuration.nix
```

## Honorable Mention
### My main inspirer (and my friend)
### fib-nm
<a href="https://github.com/fib-nm">
  <img src="https://avatars.githubusercontent.com/u/120518553?v=4" width="40" height="40" alt="octocat's profile" style="border-radius: 50%;">
  @fib-nm
</a>

![avatar](https://avatars.githubusercontent.com/u/120518553?v=4)[@fib-nm](https://github.com/fib-nm)
