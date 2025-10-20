{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                wget
                xz
                unixtools.netstat
                arp-scan-rs
                nmap
                tcpdump                
                netcat
                unixtools.arp
                dig
                ubootTools
                rpi-imager
                libisoburn
                openssl
                binsider
                binwalk
                xh

        ];

}
