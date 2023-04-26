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
        thunderbird
        vscode
        vlc
        spotify
        discord
        steam
        # TODO: notion
      ];
      hashedPassword = "$y$j9T$SVz/zu5m6IXfXSgMiooU1.$LdFNcqf1edNncuhPBQnmet77ycTL87ce7APc0SgQDkA";
    };
  };
}
