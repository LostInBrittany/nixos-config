{ config, pkgs, ... }:

{

home-manager.users.horacio = { pkgs, ... }: {
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";

  # Session configuration
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.dropbox = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.vim.enable = true;

  programs.jq.enable = true;

  programs.dircolors.enable = true;

  programs.bash.enable = true;

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jnoortheen.nix-ide
    ];
  };

  programs.git = {
    enable = true;
    userName = "Horacio Gonzalez";
    userEmail = "horacio.gonzalez@gmail.com";
  };


  # Local programs
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = [
    pkgs.httpie
    pkgs.keepassxc
    pkgs.zoom-us
    pkgs.zellij
    pkgs.libsForQt5.okular
    pkgs.gnome.gpaste
  ];

  programs.tmux.enable = true;
  programs.tmux.extraConfig =
    ''
      new-session
      set -g mouse on
    '';

  programs.bat.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number relativenumber
    '';
  };

};
}
