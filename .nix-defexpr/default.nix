{}: with import <nixpkgs> {};
buildEnv {
  name = "user-env";
  extraOutputsToInstall = [ "out" "bin" "lib" ];
  paths = [
    autocutsel
    bat
    bitwarden
    deepin.deepin-screenshot
    emacs27
    direnv
    dmenu
    exa
    feh
    gcc
    git
    go
    google-chrome
    htop
    kitty
    lf
    lorri
    neofetch
    neovim
    nerdfonts
    nix
    nodejs-12_x
    pamixer
    pavucontrol
    picom
    python38Full
    pywal
    ranger
    ripgrep
    rnix-lsp
    rustup
    spotify
    stack
    terraform-lsp
    unzip
    watchexec
    xclip
    xlockmore
    xmobar
    xmonad-with-packages
    zsh
  ];
}
