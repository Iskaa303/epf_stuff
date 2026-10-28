{ pkgs, ... }:

{
  packages = [
    pkgs.typst
    pkgs.poppler-utils
  ];

  scripts.build.exec = "typst compile poster.typ";
  scripts.build-unit2.exec = "typst compile poster-unit2.typ";
}
