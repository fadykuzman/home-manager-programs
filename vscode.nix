{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      angular.ng-template
      johnpapa.vscode-peacock
      golang.go
      ms-vscode.makefile-tools
    ];
  };
}
