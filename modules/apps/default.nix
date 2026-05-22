{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    tmux
    wget
    curl
    fastfetch
    firefox
  ];
}