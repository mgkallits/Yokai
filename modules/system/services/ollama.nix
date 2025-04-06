# Ollama

# Ollama is an open-source framework designed to facilitate the deployment of large language
# models on local environments. It aims to simplify the complexities involved in running and
# managing these models, providing a seamless experience for users across different operating
# systems.

{ config, pkgs, ... }:

{
  #   services.ollama = {
  #     enable = true;
  #     # Optional: load models on startup
  #     # loadModels = [ ... ];
  #     acceleration = "rocm";

  #     # environmentVariables = {
  #     #   HCC_AMDGPU_TARGET = "gfx1100"; # used to be necessary, but doesn't seem to anymore
  #     # };
  #     rocmOverrideGfx = "11.0.0";
  #   };

  #   services.open-webui.enable = true;
}
