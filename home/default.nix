# home/default.nix
{ ... }: {
  programs.home-manager.enable = true;
  programs.zsh.enable = true;
  home.stateVersion = "25.11";
}
