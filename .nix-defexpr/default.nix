{}: with import <nixpkgs> {}; buildEnv {
  name = "user-env";
  extraOutputsToInstall = ["out" "bin" "lib"];
  paths = [
    autocutsel
    bat
    bitwarden
    deepin.deepin-screenshot
    dmenu
    emacs
    exa
    feh
    git
    go
    google-chrome
    htop
    kitty
    lf
    neofetch
    neovim
    nerdfonts
    nix
    pamixer
    pavucontrol
    picom
    python38Full
    pywal
    stack
    unzip
    xclip
    xmobar
    xmonad-with-packages
    zsh
    xlockmore
  ];
}
