{pkgs, ...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    extraConfig = {
      core.editor = "nvim";
    };
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      editorconfig-nvim
      vim-nix
      vim-airline
      vim-airline-themes
      fzf-vim
      vim-gitgutter
    ];
    extraConfig = ''
      set number
      set ruler
      set cursorline
      set smartindent
      set laststatus=2
      set autoread
      set scrolljump=5
      set scrolloff=5
      set sidescrolloff=15
      set sidescroll=1
      syntax enable
    '';
  };

  programs.zsh.shellAliases = {
    vim = "nvim";
  };
}
