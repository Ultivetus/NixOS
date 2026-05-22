# hosts/ultivetus-uconsole/configuration.nix
{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "ultivetus-uconsole";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.11";
}