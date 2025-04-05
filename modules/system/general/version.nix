# This option defines the first version of NixOS you have installed on this particular machine, and
# is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.

# For example, if NixOS version XX.YY ships with AwesomeDB version N by default, and is then upgraded to
# version XX.YY+1, which ships AwesomeDB version N+1, the existing databases may no longer be compatible,
# causing applications to fail, or even leading to data loss.

# The stateVersion mechanism avoids this situation by making the default version of such packages conditional
# on the first version of NixOS you’ve installed (encoded in stateVersion), instead of simply always using
# the latest one.

# Note that this generally only affects applications that can’t upgrade their data automatically - applications
# and services supporting automatic migrations will remain on latest versions when you upgrade.

# Most users should never change this value after the initial install, for any reason, even if you’ve upgraded
# your system to a new NixOS release.

# This value does not affect the Nixpkgs version your packages and OS are pulled from, so changing it will
# not upgrade your system.

# This value being lower than the current NixOS release does not mean your system is out of date, out of
# support, or vulnerable.

# Do not change this value unless you have manually inspected all the changes it would make to your
# configuration, and migrated your data accordingly.

{
  config,
  pkgs,
  version,
  ...
}:

{
  system.stateVersion = "${version}";
}
