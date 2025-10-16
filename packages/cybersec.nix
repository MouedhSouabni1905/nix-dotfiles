{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                wget
                unixtools.netstat
                
        ];

}
