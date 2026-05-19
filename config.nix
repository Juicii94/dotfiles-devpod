{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "evm-tools";
      paths = [
        neovim
        ripgrep
        fzf
        lazygit
        zsh-powerlevel10k
        inter-nerdfont
      ];
    };
  };
}
