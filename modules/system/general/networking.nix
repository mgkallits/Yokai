{ 
config, options, hostname, ... }: 

{
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
  };

  # networking.interfaces.wlp1s0.useDHCP = true;
  # networking.wireless.interfaces = ["wlp1s0"];



  # networking = {
  #   interfaces = {
  #     wlp6s0 = {
  #       useDHCP = false;
  #       ipv4.addresses = [{
  #         address = "192.168.1.165";
  #         prefixLength = 24;
  #       }];
  #       ipv4.gateway = "192.168.1.254";  # Replace with your router's gateway
  #     };
  #   };
  #   # defaultGateway = "192.168.1.254";
  #   # nameservers = [ "192.168.1.162" "8.8.8.8" ];  # Use local DNS first, then fallback to Cloudflare.
  # };


  # networking = {
  #   interfaces.wlp6s0 = {
  #     ipv4.addresses = [{
  #       address = "192.168.1.100";  # Replace with your desired static IP
  #       prefixLength = 24;          # 24 means subnet mask 255.255.255.0
  #     }];
  #   };
  #   defaultGateway = "192.168.1.254";  # Ensure this is your router’s IP
  #   nameservers = ["1.1.1.1" ];  # Google & Cloudflare DNS
  # };


# --- Source nixos manual

  # Configuration 
  # An authoritative DHCP and DNS server on a home network 
  # On a home network, you can use Dnsmasq as a DHCP and DNS server. New devices on your network will be configured by Dnsmasq, and instructed to use it as the DNS server by default. This allows you to rely on your own server to perform DNS queries and caching, with DNSSEC enabled.

  # The following example assumes that

  # you have disabled your router’s integrated DHCP server, if it has one

  # your router’s address is set in networking.defaultGateway.address

  # your system’s Ethernet interface is eth0

  # you have configured the address(es) to forward DNS queries in networking.nameservers

  # {
  #   services.dnsmasq = {
  #     enable = true;
  #     settings = {
  #       interface = "eth0";
  #       bind-interfaces = true; # Only bind to the specified interface
  #       dhcp-authoritative = true; # Should be set when dnsmasq is definitely the only DHCP server on a network

  #       server = config.networking.nameservers; # Upstream dns servers to which requests should be forwarded

  #       dhcp-host = [
  #         # Give the current system a fixed address of 192.168.0.254
  #         "dc:a6:32:0b:ea:b9,192.168.0.254,${config.networking.hostName},infinite"
  #       ];

  #       dhcp-option = [
  #         # Address of the gateway, i.e. your router
  #         "option:router,${config.networking.defaultGateway.address}"
  #       ];

  #       dhcp-range = [
  #         # Range of IPv4 addresses to give out
  #         # <range start>,<range end>,<lease time>
  #         "192.168.0.10,192.168.0.253,24h"
  #         # Enable stateless IPv6 allocation
  #         "::f,::ff,constructor:eth0,ra-stateless"
  #       ];

  #       dhcp-rapid-commit = true; # Faster DHCP negotiation for IPv6
  #       local-service = true; # Accept DNS queries only from hosts whose address is on a local subnet
  #       log-queries = true; # Log results of all DNS queries
  #       bogus-priv = true; # Don't forward requests for the local address ranges (192.168.x.x etc) to upstream nameservers
  #       domain-needed = true; # Don't forward requests without dots or domain parts to upstream nameservers

  #       dnssec = true; # Enable DNSSEC
  #       # DNSSEC trust anchor. Source: https://data.iana.org/root-anchors/root-anchors.xml
  #       trust-anchor = ".,20326,8,2,E06D44B80B8F1D39A95C0B0D7C65D08458E880409BBC683457104237C7F8EC8D";
  #     };
  #   };
  # }
# ---

}
