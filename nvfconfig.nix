{config, pkgs, ...}:

let
mykeymaps = [
        {
                key = "th";
                mode = ["n"];
                action = ":bo term<CR>";
                silent = true;
                desc = "Open a terminal below";
        }
        {
                key = "tv";
                mode = ["n"];
                action = ":vert term<CR>";
                silent = true;
                desc = "Open a terminal on the side (right side)";
        }
        {
                key = "ff";
                mode = ["n"];
                action = ":Telescope find_files<CR>";
                silent = true;
                desc = "Find files in current directory using telescope";
        }
        {
                key = "fg";
                mode = ["n"];
                action = ":Telescope find_files<CR>";
                silent = true;
                desc = "Find files in current directory using telescope";
        }
        {
                key = "fb";
                mode = ["n"];
                action = ":Telescope live_grep<CR>";
                silent = true;
                desc = "Find lines in current directory using telescope";
        }
        {
                key = "fh";
                mode = ["n"];
                action = ":Telescope help_tags<CR>";
                silent = true;
                desc = "Find help tags";
        }
        {
                key = "mo";
                mode = ["n"];
                action = ":Oil --float<CR>";
                silent = true;
                desc = "Open Oil-nvim as a floating window in the current directory";
        }
];

in

{

programs.neovim.enable = true;
programs.nvf = {
        enable = true;
        settings = {
                vim = {
                        theme.enable = true;
                        theme.name = "nord";
                        theme.style = "dark";

                        languages = {
                                enableLSP = true;
                                enableTreesitter = true;

                                nix.enable = true;
                                clang.enable = true;
                                php.enable = true;
                                html.enable = true;
                                python.enable = true;
                                ruby.enable = true;
                                css.enable = true;
                                ts.enable = true;
                        };
                        telescope.enable = true;
                        binds.cheatsheet.enable = true;
                        presence.neocord.enable = true;
                        utility.oil-nvim.enable = true;
                        notes.obsidian.enable = true;
                        notes.obsidian.setupOpts = {
                                workspaces = [
                                        {
                                                name = "vault";
                                                path = "~/Notes/obsidian-backup/Zettelkasten";
                                        }
                                        ];
                                };
                        keymaps = mykeymaps;                
                        };
                };
        };

}
