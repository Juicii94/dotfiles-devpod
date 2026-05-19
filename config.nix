{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "evm-tools";
      paths = [
        neovim
        ripgrep
        fzf
        lazygit
        powerlevel10k
        inter-nerdfont
      ];
    };
  };
}
