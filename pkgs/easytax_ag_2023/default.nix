{ lib, stdenv, fetchurl, jdk17}:

stdenv.mkDerivation rec {
  pname = "easytax_ag_2023";
  version = "2023";

  src = fetchurl {
    url = "https://msg-easytax.ch/ag/${version}/EasyTax${version}AG_unix_1_1.tar.gz";
    sha256 = "6a47a7cff7232fe88f3661305464e18319b4a104233b36cdf28a2a5e52cdef70";
  };

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
    description = "EasyTax Aargau 2023";
    homepage = "https://msg-easytax.ch/ag/";
    maintainers = with maintainers; [ tttttx2 ];
  };
}
