{ pkgs, ... }:
{
  home.systemPackages = with pkgs; [
    rustup
    nodejs
    gcc
    gnumake
    python3

    llvm
    gdb
    clang-tools
    typescript-language-server
  ];
}
