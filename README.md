# MyNixOS
My very first (and most favorite) NixOS configuration and rice!
You can actually change some settings and packages in .nix files to your preferences (like comment nvidia drivers installation if you don't need them, change username, adjust disk partition size etc.) before the installation process  
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
git add .
```

## Honorable Mention
### My main inspirer (and my friend)
<a href="https://github.com/fib-nm">
  <img src="https://avatars.githubusercontent.com/u/120518553?v=4" width="20" height="20" alt="fib-nm profile" style="border-radius: 50%;">
  @fib-nm
</a>
