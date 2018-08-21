# Manpage colorization
function man
  set -lx LESS_TERMCAP_md (set_color --bold red)
  set -lx LESS_TERMCAP_me (set_color normal)
  set -lx LESS_TERMCAP_se (set_color normal)
  set -lx LESS_TERMCAP_so (set_color --background blue yellow)
  set -lx LESS_TERMCAP_ue (set_color normal)
  set -lx LESS_TERMCAP_us (set_color --bold green)
  command man $argv
end
