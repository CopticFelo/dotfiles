{ config, pkgs, ... }:
let
  ani-cli-fix = pkgs.ani-cli.overrideAttrs (
    finalAttrs: previousAttrs: {
      version = "5.1";
      src = pkgs.fetchFromGitHub {
        owner = "pystardust";
        repo = "ani-cli";
        tag = "v${finalAttrs.version}";
        hash = "sha256-lPQA3iO3F/9NS2IziQccsJ3aai6WMQy6YObdB3mDCZA=";
      };
    }
  );
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "felo";
  home.homeDirectory = "/Users/felo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    raycast
    sketchybar-app-font
    rustc
    cargo
    rustfmt
    clippy
    lulu
    anki-bin
    gh
    localsend
    vscode
    element-desktop
    nixd
    nixfmt
    ghidra-bin
    meson
    btop
    mdbtools
    ani-skip
    bison
    scrcpy
    android-tools
    radare2
    librewolf
    utm
    ani-cli-fix
    nmap
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nv = "nvim";
      ls = "ls -la";
      clr = "clear";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Copticfelo";
        email = "68559765+CopticFelo@users.noreply.github.com";
      };
    };
  };

  programs.ghostty = {
    enable = true;
    # pkgs.ghostty is currently broken on MacOS, so getting it from brew casks instead
    package = null;
    settings = {
      font-family = "FiraCode Nerd Font Mono";
      font-size = 20;
      background-opacity = 0.9;
      theme = "Adventure";
      window-decoration = "client";
      macos-titlebar-style = "tabs";
    };
  };

  programs.sketchybar = {
    enable = true;
    configType = "lua";
    # DON'T define config here cuz i want an out of store symlink
  };

  xdg.configFile."sketchybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/sketchybar";
    recursive = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/nvim";
    recursive = true;
  };

  xdg.configFile."karabiner" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/karabiner";
    recursive = true;
  };

  xdg.configFile."wallpapers" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/wallpapers";
    recursive = true;
  };

  xdg.configFile."rift" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/rift";
    recursive = true;
  };

  # currently in between paneru and rift so it's a good idea to keep them both
  xdg.configFile."paneru" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/paneru";
    recursive = true;
  };

  xdg.configFile."borders" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/borders";
    recursive = true;
  };

  # legacy/unused

  xdg.configFile."aerospace" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/aerospace";
    recursive = true;
  };

  xdg.configFile."yabai" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/yabai";
    recursive = true;
  };

  xdg.configFile."skhd" = {
    source = config.lib.file.mkOutOfStoreSymlink "/Users/felo/.nix/configs/skhd";
    recursive = true;
  };
}
