{config, pkgs, inputs, ...}:

{


	nixpkgs = {
		overlays = [
			(final: prev: {
				vimPlugins = prev.vimPlugins // {
					#nvim-plugin-name = prev.vimUtils.buildVimPlugin {
						#name = "name you want";
						#src = inputs.the_name_you_put_in_the_flakes_file
					#};
				};
			})
		];
	};

	programs.neovim = 

	let
		toLua = str: "lua << EOF\n${str}\nEOF\n";
		toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
	in

	{
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		extraLuaConfig = ''
			${builtins.readFile ./nvim/options.lua}
		'';

		plugins = with pkgs.vimPlugins; [
			
			{
				plugin = bamboo-nvim;
				config = "colorscheme bamboo";
			}
			{
				plugin = nvim-lspconfig;
				config = toLuaFile ./nvim/plugin/lsp.lua;
			}
			{
				plugin = comment-nvim;
				config = toLua "require(\"Comment\").setup()";
			}
			neodev-nvim
			telescope-nvim
			# nvim-cmp
			lualine-nvim
			nvim-web-devicons
			vim-nix
			{
			plugin = (nvim-treesitter.withPlugins (p: [
					p.tree-sitter-nix
					p.tree-sitter-vim
					p.tree-sitter-bash
					p.tree-sitter-lua
					p.tree-sitter-python
					p.tree-sitter-json
					p.tree-sitter-ruby
					p.tree-sitter-c
					# p.treesitter-yml
					# p.treesitter-ts/js
				]));
			config = toLuaFile ./nvim/plugin/treesitter.lua;
			}


		];

		extraPackages = with pkgs; [
			# other dependencies for your custom imported packages for eg
		];
	};

}
