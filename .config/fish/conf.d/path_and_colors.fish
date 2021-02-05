function add_to_path_if_exists
    for dir in $argv
        if test -d "$dir"
            set -gx fish_user_paths $fish_user_paths "$dir"
        end
    end
end

add_to_path_if_exists ~/.bin \
                      ~/.local/bin \
                      (if test -d ~/Library/Python; echo ~/Library/Python/*/bin | tr ' ' '\n'; end) \
                      ~/.cargo/bin

set fish_color_autosuggestion blue --bold --dim
set fish_color_command blue --bold
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end green
set fish_color_error red --bold
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param normal
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match purple
set fish_color_selection purple
set fish_color_user green
set fish_color_valid_path --underline
set fish_pager_color_completion normal
set fish_pager_color_description yellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan
