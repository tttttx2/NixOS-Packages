{ lib, stdenv, fetchurl, jdk17}:

stdenv.mkDerivation rec {
  pname = "easytax_ag_2023";
  version = "2023";

  src = fetchurl {
    url = "https://msg-easytax.ch/ag/${version}/EasyTax${version}AG_unix_1_1.tar.gz";
    sha256 = "6a47a7cff7232fe88f3661305464e18319b4a104233b36cdf28a2a5e52cdef70";
  };
  # echo "sha256-"$(cat elastic-agent-8.12.2-linux-x86_64.tar.gz | sha256sum| cut -f1 -d\  | xxd -r -p | base64)

  nativeBuildInputs = [
  ];

  buildInputs = [
    jdk17
  ];

  unpackPhase = "true";


  sourceRoot = ".";



  installPhase = ''
    mkdir -p $out
    tar -xzf $src
    mv EasyTax${version}AG/* $out
    mv EasyTax${version}AG/.install4j $out
    # Otherwise it looks "suspicious"
    chmod -R g-w $out
  '';

  meta = with lib; {
    description = "elastic-agent";
    homepage = "https://github.com/elastic/elastic-agent";
    license = licenses.mit;
    maintainers = with maintainers; [ tttttx2 ];
  };
}
