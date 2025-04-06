{ config, pkgs, ... }:

{
  xdg.desktopEntries = {
    rstudio = {
      name = "RStudio";
      comment = "Integrated Development Environment for R";
      exec = "${pkgs.rstudioWrapper}/bin/rstudio %U";
      icon = "rstudio";
      terminal = false;
      type = "Application";
      categories = [
        "Development"
        "IDE"
      ];
      settings = {
        MimeType = "text/x-r-source;text/x-r;text/x-markdown"; # Use `MimeType` instead of `mimeTypes`
        Keywords = "R;Data;Analysis;Statistics;IDE";
        StartupNotify = "true";
      };
    };
  };

  home.packages = with pkgs; [
    (rstudioWrapper.override {
      packages = with rPackages; [
        xml2
        xml2relational
        XML2R
        # Core data science packages
        tidyverse # Includes dplyr, ggplot2, tidyr, etc.
        data_table # Fast data manipulation
        caret # Machine learning
        randomForest # Random forest models
        xgboost # Gradient boosting
        glmnet # Regularized regression
        shiny # Interactive web apps
        rmarkdown # Reporting
        devtools # Package development
        lubridate # Date-time manipulation
        stringr # String manipulation
        httr # HTTP requests
        jsonlite # JSON handling
      ];
    })
  ];

}
