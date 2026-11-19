{ inputs, ... }:
{
  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      statusline.lualine.enable = true;
      autopairs.nvim-autopairs.enable = true;
    };
  };
}
