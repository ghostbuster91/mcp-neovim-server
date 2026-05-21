{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        shellPackages = with pkgs; [
          nodejs
          yarn
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = shellPackages;
        };
      }
    );
}
