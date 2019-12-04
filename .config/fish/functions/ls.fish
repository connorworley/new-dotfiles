# ls colorization
function ls_color
  switch "$argv"
    case 'black'
      echo 'a'
    case 'red'
      echo 'b'
    case 'green'
      echo 'c'
    case 'yellow'
      echo 'd'
    case 'blue'
      echo 'e'
    case 'magenta'
      echo 'f'
    case 'cyan'
      echo 'g'
    case 'light grey'
      echo 'h'
    case 'normal'
      echo 'x'
  end
end

function ls_color_bold
  echo (ls_color "$argv" | awk '{print toupper($0)}')
end

function ls
    # directory
    set -lx LSCOLORS (ls_color_bold 'blue')(ls_color 'normal')
    # symlink
    set -lx LSCOLORS $LSCOLORS(ls_color_bold 'cyan')(ls_color 'normal')
    # socket
    set -lx LSCOLORS $LSCOLORS(ls_color 'magenta')(ls_color 'normal')
    # pipe
    set -lx LSCOLORS $LSCOLORS(ls_color 'black')(ls_color_bold 'light grey')
    # executable
    set -lx LSCOLORS $LSCOLORS(ls_color_bold 'red')(ls_color 'normal')
    # block
    set -lx LSCOLORS $LSCOLORS(ls_color_bold 'green')(ls_color 'normal')
    # character
    set -lx LSCOLORS $LSCOLORS(ls_color_bold 'yellow')(ls_color 'normal')
    # executable with set -lxuid bit set -lx
    set -lx LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'red')
    # executable with set -lxgid bit set -lx
    set -lx LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'cyan')
    # directory writable to others, with sticky bit
    set -lx LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'green')
    # directory writable to others, without sticky bit
    set -lx LSCOLORS $LSCOLORS(ls_color 'black')(ls_color 'yellow')
    if test (uname) = 'Darwin'
        command ls -G $argv
    else
        command ls --color=always $argv
    end
end
