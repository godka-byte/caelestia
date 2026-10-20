function isOnDir
    if test (count $argv) -lt 2
        return 1
    end

    test -d "$argv[1]/$argv[2]"
end


set -Ux repos_dir ~/Documents/repos
# func aliases
function repos
    argparse c -- $argv

    if test (count $argv) -eq 0
        cd $repos_dir/
    else if set -q _flag_c
        mkdir $repos_dir/$argv[1]
        cd $repos_dir/$argv[1]
    else
        cd $repos_dir/$argv[1]
    end
end

function __repos_complete
    if not set -q repos_dir
        return
    end

    for d in $repos_dir/*
        if test -d "$d"
            basename "$d"
        end
    end
end

complete -c repos -e
complete -c repos -f -a "(__repos_complete)"

set -Ux caelestia_dir ~/.local/share/caelestia/

function cael
    if test (count $argv) -eq 0
        cd $caelestia_dir/
    else
        cd $caelestia_dir/$argv[1]
    end
end

function __cael_complete
  if not set -q caelestia_dir
    return
  end

  for d in $caelestia_dir/*
    if test -d "$d"
      basename "$d"
    end
  end
end

complete -c cael -e
complete -c cael -f -a "(__cael_complete)"

alias idle='~/.config/hypr/scripts/toggle_idle.sh'




















