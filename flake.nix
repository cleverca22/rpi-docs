{
  outputs = { nixpkgs, self }:
  {
    packages.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      inherit (pkgs) texliveMinimal;
      undocumented = pkgs.runCommand "undocumented" {
        buildInputs = [ pkgs.texliveMedium pkgs.python3 ];
        src = ./.;
      } ''
        unpackPhase
        cd $sourceRoot
        python3 ./svd2latex.py

        mkdir $out
        pdflatex $NIX_BUILD_TOP/''${sourceRoot}/undocumented.tex
        mv -vi *.pdf $out/result.pdf
        cp -v *.tex $out/
      '';
    };
  };
}
