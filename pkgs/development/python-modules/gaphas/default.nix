{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, poetry-core
, gobject-introspection
, gtk3
, pycairo
, pygobject3
, typing-extensions
}:

buildPythonPackage rec {
  pname = "gaphas";
  version = "3.5.1";
  disabled = pythonOlder "3.7";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-71oYuLhqJ7bst0W7v9tQSoaisjONZSa9zEWzYWtGl2E=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  buildInputs = [ gobject-introspection gtk3 ];

  propagatedBuildInputs = [
    pycairo
    pygobject3
    typing-extensions
  ];

  pythonImportsCheck = [ "gaphas" ];

  meta = with lib; {
    description = "GTK+ based diagramming widget";
    maintainers = with maintainers; [ wolfangaukang ];
    homepage = "https://github.com/gaphor/gaphas";
    license = licenses.asl20;
  };
}
