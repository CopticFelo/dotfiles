{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    let
      x86 = import inputs.nixpkgs-x86 {
        system = "x86_64-darwin";
      };
    in
    with pkgs;
    [
      vim
      fzf
      tree
      ripgrep
      jq
      git
    ];

  homebrew = {
    enable = true;
    casks = [
      "ghostty"
      "zen"
      "iina"
      "keka"
      "discord"
      "radix"
      "heroic"
      "balenaetcher"
      "blip"
      "wireshark"
      "mdb-accdb-viewer"
      "cloudflare-warp"
      "whatsapp"
      "transmission"
      "betterdisplay"
    ];
    brews = [
      "artginzburg/tap/sudo-touchid"
      "xcp"
      "xcode-build-server"
      "xcbeautify"
      "swiftlint"
      "pipx"
      "dotnet@9"
      "glfw3"
      "icoutils"
      "molten-vk"
      "freetype"
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.arimo
    nerd-fonts.fira-mono
  ];

}
