{ pkgs ? import <nixpkgs> {}
}:
pkgs.stdenv.mkDerivation {
  name = "tg";

  buildInputs = with pkgs; [
    gnumake
    texlive.combined.scheme-full
    python38
    python38Packages.pygments
  ];
}
