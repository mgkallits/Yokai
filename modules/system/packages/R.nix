{
  config,
  pkgs,
  ...
}:

{
  # === R programing language ==
  
  environment.systemPackages = [
    pkgs.R

    (pkgs.rWrapper.override {
      packages =
        with pkgs.rPackages;
        # let
        #   llr = buildRPackage {
        #   name = "llr";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "dirkschumacher";
        #     repo = "llr";
        #     rev = "0a654d469af231e9017e1100f00df47bae212b2c";
        #     sha256 = "0ks96m35z73nf2sb1cb8d7dv8hq8dcmxxhc61dnllrwxqq9m36lr";
        #   };
        #   propagatedBuildInputs = [ rlang  knitr];
        #   nativeBuildInputs = [ rlang knitr ];};
        # in
        [
          # knitr
          # rlang
          # llr
          tidyverse
          ## the rest of your R packages here
          devtools
          ggplot2
          binom
        ];
    })
  ];

}
