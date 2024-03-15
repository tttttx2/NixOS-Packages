{ lib, fetchFromGitHub, buildGoModule}:

buildGoModule rec {
  pname = "mito";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "elastic";
    repo = "mito";
    rev = "v${version}";
    hash = "sha256-sJYHKDmVT2n605ia+8pARqS20n+6kOq/s9hPhEdjC3g=";
  };

  vendorHash = "sha256-aGxFdPuviUwWNcEZNzZipM97sUiB6dLwmQJuodssEvo=";

  preCheck = ''
    export GOROOT="$(go env GOROOT)"
  '';

  meta = with lib; {
    description = "elastic mito";
    homepage = "https://github.com/elastic/mito";
    license = licenses.mit;
    maintainers = with maintainers; [ tttttx2 ];
  };
  checkPhase = "";
}
