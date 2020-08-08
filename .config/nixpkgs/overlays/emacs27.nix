self: super: {
  emacs27 = with self;
    stdenv.lib.overrideDerivation (self.emacs26.override { srcRepo = true; })
    (attrs: rec {
      name = "emacs-${version}${versionModifier}";
      version = "27.0";
      versionModifier = ".50";
      src = fetchGit {
        url = "git://git.sv.gnu.org/emacs.git";
        rev = "27877e7bcfa37b2c97a3dde170f870d4729ff807";
      };
      patches = [ ./clean-env.patch ./tramp-detected-warpped-gvfsd.patch ];
    });
}
