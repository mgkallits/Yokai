{
  config,
  lib,
  pkgs,
  modulesPath,
  mount-external-drives,
  ...
}:
{
  # I got an external drive mount. If connected to the device, set
  # the mount-external-drives in settings to true and rebuild.

  # Primarily used on kitsune, might change later.

  config = lib.mkMerge [
    {
      environment.systemPackages = [ pkgs.ntfs3g ];
    }
    (lib.mkIf mount-external-drives {
      fileSystems."/run/media/mgkallits/hdd1" = {
        device = "/dev/disk/by-uuid/2E440EC8440E92AF";
        fsType = "ntfs-3g";
        options = [
          "rw"
          "uid=1000"
        ];
      };

      fileSystems."/run/media/mgkallits/hdd2" = {
        device = "/dev/disk/by-uuid/9A049845049825F3";
        fsType = "ntfs-3g";
        options = [
          "rw"
          "uid=1000"
        ];
      };
    })
  ];
}
