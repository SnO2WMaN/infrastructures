{config, ...}: {
  time.timeZone = "Asia/Tokyo";

  networking.timeServers = [
    "0.jp.pool.ntp.org"
    "1.jp.pool.ntp.org"
    "2.jp.pool.ntp.org"
    "3.jp.pool.ntp.org"
  ];

  services.chrony = {
    enable = true;
  };
}
