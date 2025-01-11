{
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
        #autoLoad = true;
        settings = {
          enable_autosnippets = true;
          update_events = [
            "TextChanged"
            "TextChangedI"
            "InsertEnter"
            "InsertLeave"
          ];
        };
      };
      cmp_luasnip = {
        enable = true;
        #autoLoad = true;
      };
      friendly-snippets = {
        enable = true;
        #autoLoad = true;
      };
      cmp-nvim-lsp = {
        enable = true;
        #autoLoad = true;
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "path";}
            {name = "buffer";}
          ];
          window = {
            completion = {
              border = "solid";
            };
            documentation = {
              border = "solid";
            };
          };

          mapping = {
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
          snippet.expand =
            # lua
            ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
        };
        #autoLoad = true;
      };
    };
  };
}
