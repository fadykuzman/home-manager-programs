{
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = let
    readFile = file: "${builtins.readFile file}";
  in {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
      xclip
      wl-clipboard
      gopls
      typescript-language-server
      stylua
      eslint
      eslint_d
      java-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = readFile ./config/plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        type = "lua";
        config = "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }

      neodev-nvim

      {
        plugin = nvim-cmp;
        type = "lua";
        config = readFile ./config/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        type = "lua";
        config = readFile ./config/plugin/telescope.lua;
      }

      telescope-fzf-native-nvim
      {
        plugin = telescope-ui-select-nvim;
        type = "lua";
        config = readFile ./config/plugin/telescope-ui-select.lua;
      }
      plenary-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      lualine-nvim
      nvim-web-devicons

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-go
          p.tree-sitter-java
          p.tree-sitter-javascript
        ]);
        type = "lua";
        config = readFile ./config/plugin/treesitter.lua;
      }

      vim-nix
      vim-tmux-navigator

      go-nvim
      vim-go
      vim-unimpaired
      neo-tree-nvim
      {
        plugin = none-ls-nvim;
        type = "lua";
        config = readFile ./config/plugin/none-ls-nvim.lua;
      }
      {
        plugin = nvim-dap;
        type = "lua";
        config = readFile ./config/plugin/debugging.lua;
      }

      {
        plugin = nvim-dap-ui;
        type = "lua";
        config = readFile ./config/plugin/dap-ui.lua;
      }
      nvim-dap-go
      {
        plugin = vim-test;
        type = "lua";
        config = readFile ./config/plugin/vim-test.lua;
      }
      vimux
      nvim-notify
      (pkgs.vimUtils.buildVimPlugin {
        name = "spring-boot.nvim";
        src = inputs.nvim-spring-boot;
      })
      nvim-jdtls
    ];

    extraLuaConfig = ''
      ${readFile ./config/options.lua}
      ${readFile ./config/plugin/keymaps.lua}
    '';
  };

  programs.home-manager.enable = true;
}
