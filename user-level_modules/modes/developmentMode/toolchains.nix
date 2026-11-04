{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.developmentMode == true) {
    home.packages = with pkgs; [
      # --- C/C++ Build & Compile Toolchain ---
      gcc
      gdb
      cmake
      ninja
      clang-tools

      # --- Rust Toolchain ---
      rustc
      cargo
      rust-analyzer

      # --- Go & Runtimes ---
      go
      gopls
      nodejs
      pyright

      # --- Python Toolchain ---
      python3
      pyright
      python3Packages.debugpy

      # --- Nix Language Server ---
      nil          # LSP for Nix files

      # --- Debug Adapters (DAP) ---
      lldb
    ];
  };
}
