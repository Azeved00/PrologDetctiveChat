{ pkgs ? import <nixpkgs> {  } }:
let
    root = builtins.getEnv "PWD";
in pkgs.mkShell{
    name = "Game Development";
    buildInputs = with pkgs; [
        swiProlog
    ];
    ROOT=root;

    shellHook = ''
        echo -ne "\033]0;Trabalho de Prolog\007"
    '';
}
