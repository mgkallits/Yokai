# HIP Configuration in NixOS

# This section explains how to configure HIP (Heterogeneous-computing Interface for Portability),
# AMD's parallel computing platform, on NixOS, where paths for libraries are not hard-coded to
# traditional directory structures.

{ config, pkgs, ... }:

{

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  environment.systemPackages = [
    pkgs.rocmPackages.rocminfo
    pkgs.pciutils
    pkgs.rocmPackages.rpp
  ];
  #   systemd.tmpfiles.rules =
  #   let
  #     rocmEnv = pkgs.symlinkJoin {
  #       name = "rocm-combined";
  #       paths = with pkgs.rocmPackages; [
  #         rocblas
  #         hipblas
  #         clr
  #       ];
  #     };
  #   in [
  #     "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  #   ];
  # Understanding the Problem

  # Most software built to utilize HIP assumes that HIP libraries and tools are located in the
  # conventional path /opt/rocm. However, in NixOS, due to its declarative and reproducible design,
  # software is not stored in fixed paths like /opt. Instead, libraries are stored in specific paths
  # in the Nix store (e.g., /nix/store/...).

  # This poses a problem for software that expects HIP to reside under /opt/rocm.

  # Solution on NixOS

  # The solution is to create a symbolic link from /opt/rocm to the actual location of HIP libraries
  # in the Nix store. This is achieved using systemd tmpfiles rules.

  # == The Configuration ==

  # Create a Temporary Symlink

  # A symbolic link is created from /opt/rocm to the combined HIP libraries directory. This is done using
  # a systemd tmpfiles rule:

  #   systemd.tmpfiles.rules = let

  # Combine HIP Libraries

  # The libraries required by HIP (e.g., rocblas, hipblas, clr) are combined into a single path
  # using pkgs.symlinkJoin:

  # rocmEnv = pkgs.symlinkJoin {
  #   name = "rocm-combined";
  #   paths = with pkgs.rocmPackages; [
  #     rocblas
  #     hipblas
  #     clr
  #   ];
  # };

  # pkgs.symlinkJoin: Combines multiple library paths into a single directory structure,
  # allowing all required HIP libraries to be accessed from one location.

  # pkgs.rocmPackages: Refers to the set of ROCm (Radeon Open Compute) libraries available
  # in the Nix package set. The example lists:
  #   rocblas: ROCm Basic Linear Algebra Subprograms
  #   hipblas: HIP implementation of BLAS
  #   clr: ROCm Compute Language Runtime (used for OpenCL and HIP)
  # The result is a single directory (rocm-combined) containing all necessary HIP libraries.

  #   in [
  #     "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  #   ];

  # Key Components:
  #   L+: Specifies the creation of a symbolic link.
  #   /opt/rocm: The target path for the symlink.
  #   ${rocmEnv}: The actual path to the combined HIP libraries in the Nix store.

  # Purpose:
  #   This ensures that software expecting HIP libraries under /opt/rocm can still find them, even though
  #   the actual files are stored in the Nix store.

  # == How It Works ==

  # 1. HIP Libraries in Nix Store:
  #      The HIP libraries are pulled from the Nix store and combined into a single virtual
  #      directory (rocm-combined).

  # 2. Symbolic Link for Compatibility:
  #      The symbolic link /opt/rocm points to the combined directory, allowing software with
  #      hard-coded paths to /opt/rocm to function correctly.

  # 3. Dynamic Linking via systemd:
  #      The symbolic link is dynamically created during system boot by systemd-tmpfiles.

  # == Why This Matters ==

  # On NixOS, where the filesystem structure is managed differently, this method provides a way to:
  #   Maintain compatibility with software that relies on conventional paths.
  #   Leverage the flexibility and power of NixOS while using ROCm/HIP.

  # == Verification ==

  # To ensure that HIP is correctly set up:

  # 1. Check /opt/rocm:
  #      Verify that the symbolic link /opt/rocm points to the combined directory.
  #        $ ls -l /opt/rocm
  #      Run HIP Programs:
  #        Test programs requiring HIP should now work without modifications.

}
