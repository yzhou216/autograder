{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {inherit system;};
    in
      with pkgs; rec {
        devShell = mkShell rec {
          packages = [
            python311
            python311Packages.pip
            python311Packages.virtualenv
          ];
          buildInputs = [
          ];
          # LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
          PATH = "${~/autograder}:$PATH";
        };
      });
}
