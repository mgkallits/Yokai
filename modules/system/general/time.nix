{
  config,
  pkgs,
  timezone,
  ...
}:

{
  # == Time Zone & Hardware Clock ==

  time = {
    timeZone = "${timezone}";
    hardwareClockInLocalTime = true;
  };

}
