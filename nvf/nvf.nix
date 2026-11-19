{ pkgs, ... }:
{
  vim = {
    extraPlugins = with pkgs.vimPlugins; {
      fterm = {
        package = FTerm-nvim;
        setup = "require('FTerm').setup({ border = 'rounded', })";
      };
      gruvbox-material = {
        package = gruvbox-material;
        setup = "vim.cmd(\"colorscheme gruvbox-material\")";
      };
    };

    globals = {
      mapLeader = " ";
      gruvbox_material_better_performance = 1;
      gruvbox_material_background = "hard";
      gruvbox_material_foreground = "mix";
    };

    opts = {
      termguicolors = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      clipboard = "unnamedplus";
    };
    
    ui.nvim-highlight-colors.enable = true;
    filetree.nvimTree = {
      enable = true;
      openOnSetup = false;
    };
    statusline.lualine.enable       = true;
    treesitter.enable               = true;
    autopairs.nvim-autopairs.enable = true;
   
    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = ":NvimTreeToggle<CR>";
      }
      {
        key = "<leader>q";
        mode = "n";
        silent = true;
        action = "<CMD>lua require('FTerm').toggle()<CR>";
      }
    ];

    theme = {
      enable = true;
      style = "dark";
    };
  };
}
