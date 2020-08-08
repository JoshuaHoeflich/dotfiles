{}: with import <nixpkgs> {};
buildEnv {
  name = "user-env";
  extraOutputsToInstall = [ "out" "bin" "lib" ];
  paths = [ packageList ];
}
