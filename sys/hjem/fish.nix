{
  hjem.users.lune.files.".config/fish/config.fish".text = ''
    set -U fish_greeting ""
    set -gx EDITOR       "nvim"
    set -gx VISUAL       "nvim"
    set -gx TERM         "foot"
    set -gx NH_FLAKE     "$HOME/.config/nixos"
      
    function fish_prompt
      set -l last_status $status
      set -l stat
      
      if test $last_status -ne 0
      	set stat (set_color brred)" $last_status  "(set_color --reset)
      else
      	set stat " " 
      end
      
      string join "" -- \n (set_color blue) (set_color --background brwhite) '  ' (set_color black) ' '  (whoami) '  ' (prompt_pwd) ' ' (set_color brwhite) (set_color --background normal) '' $stat
    end
      
    function mkcd -a name
      command mkdir $name && cd $name
    end
     
    alias ll="ls -la"
    alias search="nix-search"
  '';
}
