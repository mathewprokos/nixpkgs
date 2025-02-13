{ lib, python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "pyradio";
  version = "0.8.9.15";

  propagatedBuildInputs = with python3Packages; [
    requests
    psutil
    dnspython
  ];

  src = fetchFromGitHub {
    owner = "coderholic";
    repo = pname;
    rev = version;
    sha256 = "sha256-r4T7t8Q46N59jqTkvdKBo6tffkrOYhoO/CZWvkBHOAQ=";
  };

  checkPhase = ''
    $out/bin/pyradio --help
  '';

  meta = with lib; {
    homepage = "http://www.coderholic.com/pyradio/";
    description = "Curses based internet radio player";
    license = licenses.mit;
    maintainers = with maintainers; [ contrun ];
  };
}
