{ pkgs ? import <nixpkgs> {}
}:
pkgs.stdenv.mkDerivation {
  name = "tg";

  buildInputs = with pkgs; [
    gnumake
    texlive.combined.scheme-full
  ];
}
