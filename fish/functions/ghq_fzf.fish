function ghq_fzf
    set -l dest_dir (ghq list --full-path | fzf --reverse)
    if test -n "$dest_dir"
        cd $dest_dir
    end
    commandline -f repaint
end
