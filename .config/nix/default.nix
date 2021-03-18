{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.buildEnv {
  name  = "joshua-desktop";
  paths = with pkgs; [
    act
    slack
    zoom-us
    alacritty
    bitwarden
    dejavu_fonts
    direnv
    discord
    efibootmgr
    emacs
    exa
    fira-code
    fira-code-symbols
    firefox
    git
    gitAndTools.hub
    gnumake
    google-chrome
    inconsolata
    mupdf
    nix-direnv
    nixfmt
    nodejs-14_x
    noto-fonts
    noto-fonts-emoji
    numix-cursor-theme
    pamixer
    pavucontrol
    pciutils
    picom
    python38
    python38Packages.python-language-server
    racket
    rnix-lsp
    rofi
    shellcheck
    zsh
  ];
}
