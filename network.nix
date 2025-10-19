{config, pkgs, ...}:

{

        networking = {
                useNetworkd = true;

                bridges.br0.interfaces = ["enp46s0" "wlp45s0"];

                networking.useDHCP = false;

                networking.interfaces.br0.useDHCp = true;

                interface.br0.ipv4.addresses = [
                        { address = "192.168.1.100"; prefixLength = 24; }
                ];
        };

}
