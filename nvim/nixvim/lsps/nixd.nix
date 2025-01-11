{
  programs.nixvim = {
    plugins.lsp.servers = {
      nixd = {
        enable = true;
				autostart = true;
        extraOptions = {
          settings.nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }";
						};
            formatting = {
              command = ["alejandra"];
            };
          };
        };
      };
    };
    extraConfigLua = ''
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {desc = 'Format File'})
    '';
  };
}
