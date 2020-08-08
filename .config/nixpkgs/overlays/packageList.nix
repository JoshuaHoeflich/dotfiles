self: super:
{
  packageList = with self; buildEnv {
    name = "user-packages";
    extraOutputsToInstall = [ "out" "bin" "lib" ];
    paths = [
       autocutsel
       bat
       bitwarden
       dash
       deepin.deepin-screenshot
       direnv
       dmenu
       emacs27
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
  };
}
