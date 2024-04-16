{ lib, fetchFromGitHub, buildGoModule}:

buildGoModule rec {
  pname = "mito";
  version = "1.10.0";

  src = fetchFromGitHub {
    owner = "elastic";
    repo = "mito";
    rev = "v${version}";
    hash = "8e142ae1aab52108b94ae855897fc442c5aa124bded5ba8a2a73b62e405720df";
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
