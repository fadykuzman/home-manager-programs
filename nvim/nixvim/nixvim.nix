{pkgs, ...}: {
  imports = [
    (import ./lsps/nixd.nix)
    (import ./plugins/cmp.nix)
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    colorschemes.gruvbox.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    globals = {
      have_nerd_font = true;
    };

    plugins = {
      treesitter.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      lightline.enable = true;
      nvim-tree.enable = true;
      lazy = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
          vim-unimpaired
          vim-tmux-navigator
      #    					nvim-cmp
      #    					cmp-nvim-lsp
      #    					luasnip
      #    					cmp_luasnip
      #    					friendly-snippets
        ];
      };
      #			tmux-navigator.enable = true;
      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          angularls.enable = true;
          bashls.enable = true;
          gopls = {
            enable = true;
            autostart = true;
          };
          golangci_lint_ls = {
            enable = true;
            autostart = true;
          };
          html.enable = true;
          lua_ls.enable = true;
          pylsp.enable = true;
        };
      };
    };

    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.silent = true;
      }
    ];
  };
}
