{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      package = pkgs.nerd-fonts.meslo-lg;
      name = "MesloLG Nerd Font";
      size = 16.0;
    };
    settings = {
      initial_window_width = "1920";
      initial_window_height = "1080";
    };
  };
}
