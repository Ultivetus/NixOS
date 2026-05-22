# home/ultivetus.nix
{ pkgs, ... }: {
  imports = [ ./default.nix ];

  home.username = "ultivetus";
  home.homeDirectory = "/home/ultivetus";
  programs.git = {
    enable = true;
    userName = "ultivetus";
    userEmail = "ultivetus@protonmail.com";
  };

  home.packages = with pkgs; [
    obsidian
  ];
}