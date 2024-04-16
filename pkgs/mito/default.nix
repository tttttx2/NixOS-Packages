{ lib, fetchFromGitHub, buildGoModule}:

buildGoModule rec {
  pname = "mito";
  version = "1.10.0";

  src = fetchFromGitHub {
    owner = "elastic";
    repo = "mito";
    rev = "v${version}";
    hash = "sha256-VeJ8zx2tOGwtNSqE5wjcZjdjez0mlpXq03a/yOrt2cA=";
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
