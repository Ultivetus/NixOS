# home/guest.nix
{ pkgs, ... }: {
  imports = [ ./default.nix ];

  home.username = "guest";
  home.homeDirectory = "/home/guest";
  programs.git = {
    enable = true;
    userName = "ultivetus";
    userEmail = "ultivetus@protonmail.com";
  };

  home.packages = with pkgs; [
  ];
}
