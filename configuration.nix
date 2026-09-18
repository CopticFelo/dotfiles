{ inputs, ... }: {
  # environment.variables = {
  #   PKG_CONFIG_PATH = "/opt/local/lib/pkgconfig/:opt/homebrew/lib/pkgconfig/";
  # };

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };

  users.users.felo = {
    name = "felo";
    home = "/Users/felo";
  };

  system.primaryUser = "felo";

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
