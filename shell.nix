{
  pkgs ? import (fetchGit {
    url = https://github.com/NixOS/nixpkgs-channels;
    ref = "nixos-16.03";
  }) {},
  ruby ? pkgs.ruby_1_9,
  bundler ? pkgs.bundler.override { inherit ruby; }
}:

pkgs.stdenv.mkDerivation {
  name = "mail_view";

  buildInputs = with pkgs; [
    ruby
    bundler
  ];

  shellHook = ''
    mkdir -p .local-data/gems
    export GEM_HOME=$PWD/.local-data/gems
    export GEM_PATH=$GEM_HOME
  '';
}
