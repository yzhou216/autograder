{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Nix
            nil
            nixfmt-rfc-style

            gnumake
            git

            python3
            python3.pkgs.build
            digital
          ];
          DIGITAL_JAR = "${pkgs.digital}/share/java/Digital.jar";
        };
      }
    );
}
