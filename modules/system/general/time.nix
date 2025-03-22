{ config, timezone, ... }:

{
  time.timeZone = "${timezone}";
  time.hardwareClockInLocalTime = true;
}