{ config, pkgs, ... }:
{
  # Mark likes passwordless sudo
  security.sudo.extraRules = [
    {
      users = [ "mark" ];
      commands = [ { command = "ALL"; options = [ "NOPASSWD" "SETENV" ]; } ];
    }
  ];

  # Define users
  users = {
    defaultUserShell = pkgs.zsh;
    users.mark = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      packages = with pkgs; [
        tmux
        firefox
        thunderbird
        vscode
        lazygit
        yadm
        zplug
        python311
        vlc
        spotify
        htop
        nodejs
        tree
        # TODO: notion
      ];
      hashedPassword = "$y$j9T$SVz/zu5m6IXfXSgMiooU1.$LdFNcqf1edNncuhPBQnmet77ycTL87ce7APc0SgQDkA";
    };
  };

  home-manager.users.mark = { pkgs, ... }: {
    home.packages = with pkgs; [
      cowsay
    ];
    home.stateVersion = "22.11";
  };
}
