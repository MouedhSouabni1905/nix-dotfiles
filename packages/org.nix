{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                obsidian
                bashcards
                d2
                bartib
        ];

}
