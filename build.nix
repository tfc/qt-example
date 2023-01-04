{ stdenv
, qtbase
, full
, cmake
, wrapQtAppsHook
}:
stdenv.mkDerivation {
  pname = "qt-example";
  version = "1.0";

  src = ./qt-example;

  buildInputs = [
    qtbase
    full
  ];

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
  ];

  installPhase = ''
    ls -lsa
    mkdir -p $out/bin
    cp qt-example $out/bin/
  '';
}
