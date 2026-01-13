{
  python3Packages,
  fetchFromGitHub,
  lib,
  python3,
}:

python3Packages.buildPythonPackage rec {
  pname = "pygad";
  version = "3.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ahmedfgad";
    repo = "GeneticAlgorithmPython";
    tag = "${version}";
    hash = "sha256-oY8T3fIJJ++T2rCL6naj8TuNJk3CdV76ubI3+lJ4E+g=";
  };

  build-system = [
    python3.pkgs.setuptools
  ];

  dependencies = with python3.pkgs; [
    numpy
    matplotlib
    cloudpickle
  ];

  nativeCheckInputs = [
  ];

  pythonImportsCheck = [ "pygad" ];

  meta = {
    description = "Source code of PyGAD, a Python 3 library for building the genetic algorithm and training machine learning algorithms (Keras & PyTorch).";
    homepage = "https://github.com/ahmedfgad/GeneticAlgorithmPython";
    license = lib.licenses.bsd3ClauseTso;
    maintainers = [
      lib.maintainers.natsukium
      lib.maintainers.sarahec
    ];
  };
}
