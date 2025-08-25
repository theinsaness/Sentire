# flake.nix
{
    description = "Simple flake for sentire frontend";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, utils }:
        utils.lib.eachDefaultSystem (
            system:
        let
            # pkgs = nixpkgs.legacyPackages.${system};
            pkgs = import nixpkgs { inherit system; };
            frontend = with pkgs; [
                nodejs_24
            ];
        in {
            devShell = pkgs.mkShell {
                packages = frontend;
                # shellHook = ''
                    #   export MY_VAR="hello world"
                # '';
            };
        }
    );
}
