{ pkgs, ... }: {
  programs.zsh.enable = true;

  users.users = {
    ultivetus = {
      isNormalUser = true;
      description = "Main Account";
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
      shell = pkgs.zsh;
      #initialPassword = "1234"; 
    };

    guest = {
      isNormalUser = true;
      description = "Guest Account";
      extraGroups = [ "networkmanager" "video" "audio" ];
      shell = pkgs.zsh;
      #initialPassword = "1234"; 
    };
  };
}