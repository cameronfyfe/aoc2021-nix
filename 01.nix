let

  common = import ./common.nix;
  pkgs = common.pkgs;
  input = import ./inputs/01.input.nix;

  countIncreases = with builtins; with pkgs.lib.lists; with common.lib;
    ms:
    length (filter id (zipListsWith gt (tail ms) ms));

  part1 = countIncreases input;

  part2 =
    let
      windowSums = with builtins; with pkgs.lib.lists;
        zipListsWith add (zipListsWith add input (tail input)) (tail (tail input));
    in
    countIncreases windowSums;

in

{ inherit part1 part2; }
