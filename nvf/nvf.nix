{
  vim = {
    globals.mapleader = " ";

    opts = {
      termguicolors = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      clipboard = "unnamedplus";
    };
    
    ui.nvim-highlight-colors.enable = true;
    filetree.nvimTree.enable        = true;
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
    ];

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
  };
}
