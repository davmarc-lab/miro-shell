{
  description = "Quickshell Configuration Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          kdePackages.qtsvg
          kdePackages.qtimageformats
          kdePackages.qtmultimedia
          kdePackages.qt5compat
          quickshell
        ];

        shellHook = ''
          echo "🚀 Miro-Shell Development Environment"
          echo "------------------------------------"
        '';
      };
    };
}

