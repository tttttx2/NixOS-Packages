{ lib, stdenv, fetchurl, jdk17, makeWrapper}:

stdenv.mkDerivation rec {
  pname = "easytax_ag_2023";
  version = "2023";

  src = fetchurl {
    url = "https://msg-easytax.ch/ag/${version}/EasyTax${version}AG_unix_1_1.tar.gz";
    sha256 = "6a47a7cff7232fe88f3661305464e18319b4a104233b36cdf28a2a5e52cdef70";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  buildInputs = [
    jdk17
  ];

  unpackPhase = "true";


  sourceRoot = ".";



  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/opt
    tar -xzf $src
    mv EasyTax${version}AG $out/opt/
    #ln -s "$out/opt/EasyTax${version}AG/EasyTax${version}_AG" "$out/bin/easytax_ag_2023"
    # Otherwise it looks "suspicious"
    makeWrapper $out/opt/EasyTax${version}AG/EasyTax${version}_AG $out/bin/easytax_ag_2023 \
      --prefix PATH : ${jdk17}/bin \



    chmod -R g-w $out
  '';

  meta = with lib; {
    description = "EasyTax Aargau 2023";
    homepage = "https://msg-easytax.ch/ag/";
    maintainers = with maintainers; [ tttttx2 ];
  };
}
