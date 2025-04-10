{
    description = "Flakes for different languages";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = { self, nixpkgs, ... }@inputs:
        inputs.flake-utils.lib.eachDefaultSystem (system: let
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            devShells = {
                java = pkgs.mkShell {
                    nativeBuildInputs = [
                        pkgs.jdk21
                        pkgs.jdt-language-server
                    ];
                };
                cpp = pkgs.mkShell {
                  nativeBuildInputs = [
                      pkgs.gcc
                      pkgs.gnumake
                      pkgs.clang-tools
                  ];
                };
                python = pkgs.mkShell {
                    nativeBuildInputs = [
                        pkgs.python3
                    ];
                };
            };
        });
}
