{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.buildEnv {
  name  = "joshua-desktop";
  paths = with pkgs; [
    act
    alacritty
    bitwarden
    clang
    dejavu_fonts
    direnv
    discord
    efibootmgr
    emacs
    exa
    feh
    fira-code
    fira-code-symbols
    firefox
    gimp
    git
    gitAndTools.hub
    gnumake
    google-chrome
    inconsolata
    kitty
    mupdf
    nix-direnv
    nixfmt
    nodePackages.typescript-language-server
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
    slack
    zoom-us
    zsh
  ];
}
