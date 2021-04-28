{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "home";
  buildInputs = with pkgs; [

  ];
}
