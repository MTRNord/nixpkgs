{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, pyyaml
}:

buildPythonPackage rec {
  pname = "yamlordereddictloader";
  version = "0.4.2";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Nq8vYhD8/12k/EwS4dgV+XPc60EETnleHwYRXWNLyhM=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    pyyaml
  ];

  # no tests
  doCheck = false;

  pythonImportsCheck = [ "yamlordereddictloader" ];

  meta = with lib; {
    description = "YAML loader and dump for PyYAML allowing to keep keys order";
    homepage = "https://github.com/fmenabe/python-yamlordereddictloader";
    license = licenses.mit;
    maintainers = with maintainers; [ hexa ];
  };
}
