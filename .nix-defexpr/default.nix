{}: with import <nixpkgs> {}; buildEnv {
  name = "user-env";
  extraOutputsToInstall = ["out" "bin" "lib"];
  paths = [
    autocutsel
    bat
    bitwarden
    deepin.deepin-screenshot
    direnv
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
    ripgrep
    rnix-lsp
    spotify
    stack
    terraform-lsp
    unzip
    xclip
    xlockmore
    xmobar
    xmonad-with-packages
    zsh
  ];
}
