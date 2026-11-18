{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = [
      pkgs.vimPlugins.nvim-web-devicons
      {
        plugin = pkgs.vimPlugins.lualine-nvim;
        config = ''
          require("lualine").setup()
        '';
      }
      {
        plugin = pkgs.vimPlugins.nvim-autopairs;
        config = ''
          require("nvim-autopairs").setup()
        '';
      }
      {
        plugin = pkgs.vimPlugins.nvim-tree-lua;
        config = ''
          require("nvim-tree").setup()
        '';
      }
      {
        plugin = pkgs.vimPlugins.FTerm-nvim;
        config = ''
          require("FTerm").setup {
            borders = "rounded"
          }
        '';
      }
      {
        plugin = pkgs.vimPlugins.nvim-highlight-colors;
        config = ''
          require("nvim-highlight-colors").setup {
          	render = "background",
          	enable_hex = true,
          	enable_short_hex = true,
          	enable_rgb = true,
          	enable_hsl = true,
          	enable_ansi = true,
          	enable_xterm256 = true,
          	enable_xtermTrueColor = true,
          	exclude_buffer = function(bufnr) end
          }
        '';
      }
      {
        plugin = pkgs.vimPlugins.gruvbox-material;
        config = ''
          vim.g.gruvbox_material_better_performance = 1
          vim.g.gruvbox_material_background = "hard"
          vim.g.gruvbox_material_foreground = "mix"
          vim.cmd("colorscheme gruvbox-material")
        '';
      }
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.toml
        p.nix
        p.lua
        p.yuck
        p.scss
      ]))
    ];

    initLua = ''
      vim.opt.termguicolors = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.softtabstop = 2
      vim.opt.clipboard = "unnamedplus"
      vim.g.mapleader = " "
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
      vim.keymap.set('n', '<leader>q', '<CMD>lua require("FTerm").toggle()<CR>')

      vim.api.nvim_create_autocmd('Filetype', {
        pattern = { 'lua', 'nix', 'toml' },
        callback = function()
          vim.treesitter.start()
	      end
      })
    '';
  };
}
