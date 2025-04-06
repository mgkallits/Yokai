{
  config,
  pkgs,
  username,
  ...
}:

{
  services.getty = {
    autologinUser = "${username}";
  };
}
