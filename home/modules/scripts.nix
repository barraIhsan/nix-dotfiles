{ pkgs, ... }:
let
  scriptsDir = ../scripts;

  scriptFiles = pkgs.lib.filterAttrs (name: type: type == "regular") (builtins.readDir scriptsDir);

  scriptNames = builtins.attrNames scriptFiles;

  # pull out "# deps: a b c" from a script's text, return list of strings
  parseDeps =
    text:
    let
      lines = pkgs.lib.splitString "\n" text;
      depLine = pkgs.lib.findFirst (l: pkgs.lib.hasPrefix "# deps:" l) null lines;
    in
    if depLine == null then
      [ ]
    else
      pkgs.lib.splitString " " (pkgs.lib.removePrefix "# deps: " depLine);

  mkScript =
    name:
    let
      text = builtins.readFile (scriptsDir + "/${name}");
      depNames = parseDeps text;
    in
    pkgs.writeShellApplication {
      inherit name;
      runtimeInputs = map (n: pkgs.${n}) depNames;
      text = text;
    };
in
{
  home.packages = map mkScript scriptNames;
}
