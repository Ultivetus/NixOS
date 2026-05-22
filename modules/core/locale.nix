{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Seoul";
  i18n = {
    defaultLocale = "ko_KR.UTF-8";
    supportedLocales = [
      "ko_KR.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
    ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-hangul
        fcitx5-gtk
      ];
    };
  };

  console.keyMap = "us";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans     # 본고딕 (한글 필수)
      noto-fonts-cjk-serif    # 본명조
      nanum-fonts             # 나눔 폰트
      jetbrains-mono          # 개발용 고정폭 폰트
    ];
    
    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans CJK KR" "NanumGothic" ];
      serif = [ "Noto Serif CJK KR" "NanumMyeongjo" ];
      monospace = [ "JetBrains Mono" ];
    };
  };
}