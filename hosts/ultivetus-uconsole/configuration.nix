# hosts/ultivetus-uconsole/configuration.nix
{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.grub.enable = true;
  boot.initrd.availableKernelModules = [ "nvme" "pcie-brcmstb" ];
  boot.kernelParams = [ "pciex1" ];
  boot.loader.grub.device = "/dev/nvme0n1";
  networking.hostName = "ultivetus-uconsole";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
