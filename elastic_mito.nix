{ pkgs ? import <nixpkgs> {} }:
pkgs.buildGoModule rec {
  pname = "mito";
  version = "1.9.0";

  src = pkgs.fetchFromGitHub {
    owner = "elastic";
    repo = "mito";
    rev = "v${version}";
    hash = "sha256-sJYHKDmVT2n605ia+8pARqS20n+6kOq/s9hPhEdjC3g=";
  };

  vendorHash = "sha256-aGxFdPuviUwWNcEZNzZipM97sUiB6dLwmQJuodssEvo=";

  preCheck = ''
    export GOROOT="$(go env GOROOT)"
  '';

  meta = with pkgs.lib; {
    description = "message stream processing engine based on CEL";
    homepage = "https://github.com/elastic/mito";
    license = licenses.asl20;
    maintainers = with maintainers; [ tttttx2 ];
  };
  checkPhase = "";

}
