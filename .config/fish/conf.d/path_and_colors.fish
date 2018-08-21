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

set fish_color_autosuggestion 555\x1eyellow
set fish_color_command 005fd7\x1epurple
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end green
set fish_color_error red\x1e\x2d\x2dbold
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param 00afff\x1ecyan
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_selection \x2d\x2dbackground\x3dpurple
set fish_color_user green
set fish_color_valid_path \x2d\x2dunderline
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan
