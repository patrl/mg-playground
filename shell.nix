let
  jupyter = import (builtins.fetchGit {
    url = https://github.com/tweag/jupyterWith;
    rev = "";
  }) {};

  ihaskellWithPackages = jupyter.kernels.iHaskellWith {
      packages = p: with p; [
        containers
        diagrams
        diagrams-contrib
        diagrams-cairo
        diagrams-rasterific
        ihaskell-diagrams
      ];
    };

  jupyterlabWithKernels =
    jupyter.jupyterlabWith {
      kernels = [ ihaskellWithPackages ];
      directory = ./jupyterlab;
    };
in
  jupyterlabWithKernels.env
