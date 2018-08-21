if test (uname) = 'Darwin'
    function readlink
        command greadlink $argv
    end
end

function _aactivator --on-event fish_prompt
    if type -q aactivator
        set -lx AACTIVATOR_VERSION 1.0.0
        set -l aactivator_output (yes | aactivator)
        if string match -q -- '* aactivator security-check .activate.sh *' "$aactivator_output"
            # aactivator wants to activate...
            if aactivator security-check .activate.sh
                source (readlink -f .activate.sh).fish ^ /dev/null
                set -gx AACTIVATOR_ACTIVE (pwd)
                end
        else if string match -q -- 'OLDPWD_bak="$OLDPWD"*' "$aactivator_output"
            # aactivator wants to deactivate...
            if aactivator security-check "$AACTIVATOR_ACTIVE/.deactivate.sh"
                # source (readlink -f "$AACTIVATOR_ACTIVE/.deactivate.sh").fish
                deactivate
                set --erase -gx AACTIVATOR_ACTIVE
            end
        end
    end
end
