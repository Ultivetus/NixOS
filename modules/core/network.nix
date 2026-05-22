{ config, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      # allowedTCPPorts = [ 22 80 ]; # 예: SSH나 웹서버를 열고 싶을 때 주석 해제
      # allowedUDPPorts = [ ... ];
    };

    wireless.iwd.enable = false; # NetworkManager와 충돌 방지를 위해 기본 무선 백엔드는 끔
  };

  environment.systemPackages = with pkgs; [
  ];
}