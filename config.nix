{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "evm-tools";
      paths = [
        neovim
        ripgrep
        fzf
        lazygit
        inter-nerdfont
        tmux
        tmuxPlugins.catppuccin
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.tmux-sessionx
      ];
    };
  };
}
