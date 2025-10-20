{config, pkgs, ...}:

{
        boot.kernel.sysctl = {
                "net.ipv4.ip_forward" = true;
                "net.ipv6.conf.all.forwarding" = true;
        };

        networking = {

                hostName = "nixos";

                nameservers = [ "198.168.10.173" ];

                #dhcpcd.extraConfig = '' nohook resolv.conf '';

                # networkmanager.ensureProfiles.profiles = {
                #         home-wifi = {
                #               connection = {
                #                       id = "home-wifi";
                #                       permissions = "";
                #                       type = "wifi";
                #               };
                #               ipv4.ignore-auto-dns = true;
                #         };
                #};

                interfaces.enp46s0 = {
                        useDHCP = false;
                        ipv4.addresses = [{
                                address = "198.168.10.1";
                                prefixLength = 24;
                        }];
                };

                nat = {
                        enable = true;
                        externalInterface = "wlp45s0";
                        internalInterfaces = [ "enp46s0" ];
                };

                firewall = {
                        enable = true;
                        allowedUDPPorts = [ 53 67 ]; # 53 for DNS, 67 for DHCP
                        allowedTCPPorts = [ 80 443 22 ];
                        allowPing = true;
                };

        };


        services.dnsmasq = {
                enable = true;
                resolveLocalQueries = false;
                settings = {
                        expand-hosts = true;
                        address = [
                                "198.168.10.173" # Resolve all .dev.local domains to localhost for development
                        ];
                        interface = "enp46s0";
                        "dhcp-range" = [ "198.168.10.100,198.168.10.200,255.255.255.0,24h" ];
                        "dhcp-authoritative" = true;
                        #"server" = [ "1.1.1.1" "8.8.8.8" ];
                };
        };

}
