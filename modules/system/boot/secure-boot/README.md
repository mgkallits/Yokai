# Instructions on setting up Secure Boot on NixOS

Use the following to check the state of the secure boot:

```sh
[mgkallits@kitsune ~]$ sudo bootctl status
```

This should output something like this

```
[mgkallits@kitsune ~/.dotfiles]$ sudo bootctl status
[sudo] password for mgkallits: 
System:
      Firmware: UEFI 2.70 (American Megatrends 5.17)
 Firmware Arch: x64
   Secure Boot: disabled (setup)
  TPM2 Support: yes
  Measured UKI: no
  Boot into FW: supported

Current Boot Loader:
      Product: systemd-boot 256.4
     Features: ✓ Boot counting
               ✓ Menu timeout control
               ✓ One-shot menu timeout control
               ✓ Default entry control
               ✓ One-shot entry control
               ✓ Support for XBOOTLDR partition
               ✓ Support for passing random seed to OS
               ✓ Load drop-in drivers
               ✓ Support Type #1 sort-key field
               ✓ Support @saved pseudo-entry
               ✓ Support Type #1 devicetree field
               ✓ Enroll SecureBoot keys
               ✓ Retain SHIM protocols
               ✓ Menu can be disabled
               ✓ Boot loader sets ESP information
          ESP: /dev/disk/by-partuuid/3317c6c2-faf2-403d-943f-d1aee1d955d8
         File: └─/EFI/SYSTEMD/SYSTEMD-BOOTX64.EFI
``` 

Make sure you have installed the following packages:

```nix
  environment.systemPackages = with pkgs; [
    sbctl niv # packages needed to setup lanzaboote	   
  ];
```

1. Create the Secure Boot keys using sbctl:
    ```
    [mgkallits@kitsune ~/.dotfiles]$ sudo sbctl create-keys
    [sudo] password for mgkallits: 
    Created Owner UUID 771465d6-ea1b-4747-adeb-b9ea66178632
    Creating secure boot keys...✓ 
    Secure boot keys created!
    ```
2. Change directory and initialize niv:
    ```
    [mgkallits@kitsune ~/.dotfiles]$ cd modules/boot 
    [mgkallits@kitsune ~/.dotfiles/modules/boot]$ niv init
    Initializing
    Creating nix/sources.nix
    Creating nix/sources.json
    Using known 'nixpkgs' ...
    Adding package nixpkgs
        Writing new sources file
    Done: Adding package nixpkgs
    Done: Initializing
    ```
3. Add lanzaboote as a dependency of your niv project and track a stable release tag (https://github.com/nix-community/lanzaboote/releases):
    ```
    [mgkallits@kitsune ~/.dotfiles/modules/boot]$ niv add nix-community/lanzaboote -r v0.4.1 -v 0.4.1
    Adding package lanzaboote
    Writing new sources file
    Done: Adding package lanzaboote
    ```

Then configure your system to enable the Secure Boot stack
```nix .dotfiles/flake.nix
{
  description = "A SecureBoot-enabled NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, ...}: {
    nixosConfigurations = {
      yourHost = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # This is not a complete NixOS configuration and you need to reference
          # your normal configuration here.

          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/etc/secureboot";
            };
          })
        ];
      };
    };
  };
}
``` 

Now rebuild your system and check `sbctl verify` output:
```
[mgkallits@kitsune ~]$ sudo sbctl verify                  
Verifying file database and EFI images in /boot...
✓ /boot/EFI/Boot/bootx64.efi is signed
✓ /boot/EFI/Linux/nixos-generation-9-xu6qa5wu55fsoph5rakvrmd7atjiewge4zf2kjchay46cr2qmepq.efi is signed
✗ /boot/EFI/nixos/kernel-6.11.1-riisztmu235rjjwg6mr734kynuphn73blc7lqbu6hx2qsszaqjha.efi is not signed 
✓ /boot/EFI/systemd/systemd-bootx64.efi is signed
```

Reboot and change Secure Boot on bios from `Other OS` -> `Windows UEFI` (make sure there are no left over keys).

Run the following to enroll our keys in order activate Secure Boot. We include Microsoft keys here to avoid boot issues.
```   
[mgkallits@kitsune ~]$ sudo sbctl enroll-keys --microsoft
[sudo] password for mgkallits: 
Enrolling keys to EFI variables...
With vendor keys from microsoft...✓ 
Enrolled keys to the EFI variables!
```

Reboot once again, and after you have booted, Secure Boot is activated and in user mode:
```
[mgkallits@kitsune ~]$ sudo bootctl status               
[sudo] password for mgkallits: 
System:
      Firmware: UEFI 2.70 (American Megatrends 5.17)
 Firmware Arch: x64
   Secure Boot: enabled (user)
  TPM2 Support: yes
  Measured UKI: yes
  Boot into FW: supported
```