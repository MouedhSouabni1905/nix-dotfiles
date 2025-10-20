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
		toLua = str: "lua << EOF\n${str}\nEOF\n"
		toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n"
	in

	{
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		extraLuaConfig = ''
			${builtins.ReadFile ./nvim/options.lua}
		'';

		plugins = with pkgs.vimPlugins; [
			
			bamboo-nvim
			{
				plugin = bamboo-nvim;
				config = "colorscheme bambon";
			}
			nvim-lspconfig
			{
				plugin = nvim-lspconfig;
				config = toLuaFile ./nvim/plugin/lsp/lua;
			}
			comment-nvim
			{ # a set that defines configurations for the plugins
				plugin = comment-nvim;
				config = toLua "require(\"Comment\").setup()";
			}
			neodev-nvim
			telescope-nvim
			# nvim-cmp
			lualine-nvim
			nvim-web-devicons
			vim-nix
			(nvim-treesitter.withPlugins (p: [
				p.treesitter-nix
				p.treesitter-vim
				p.treesitter-bash
				p.treesitter-lua
				p.treesitter-python
				p.treesitter-json
				p.treesitter-ruby
				p.treesitter-c
				# p.treesitter-yml
				# p.treesitter-ts/js
			]));

		];

		extraPackages = with pkgs; [
			# other dependencies for your custom imported packages for eg
		];
	};

}
