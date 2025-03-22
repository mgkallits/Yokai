{ config, pkgs, ... }:

{
    # Whether to enable i2c devices support. By default access is granted to users
    # in the "i2c" group (will be created if non-existent) and any user with a seat,
    # meaning logged on the computer locally .
    
    # hardware.i2c.enable = true;
}
