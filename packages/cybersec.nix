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
        ];

}
