function fish_prompt
    set -l cwd (string replace $HOME '~' $PWD)

    # Git info
    set -l git_info
    set -l git_branch (command git symbolic-ref --short HEAD 2>/dev/null)
    if test -n "$git_branch"
        set -l staged ""
        set -l unstaged ""
        command git diff --cached --quiet 2>/dev/null; or set staged (set_color green)"*"
        command git diff --quiet 2>/dev/null; or set unstaged (set_color yellow)"+"
        set git_info (set_color -b black)" $staged$unstaged"(set_color white)"$git_branch "(set_color normal)
    end

    # Kubernetes info
    set -l kube_info
    if type -q kubectl
        set -l kube_ctx (command kubectl config current-context 2>/dev/null)
        if test -n "$kube_ctx"
            set -l kube_ns (command kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
            test -z "$kube_ns"; and set kube_ns "default"
            set kube_info (set_color -b black)" "(set_color white)"$kube_ctx > $kube_ns "(set_color normal)
        end
    end

    # GCP info
    set -l gcp_info
    if test -f $HOME/.config/gcloud/active_config
        set -l active_config (cat $HOME/.config/gcloud/active_config)
        set -l project_id (awk '/project/{print $3}' $HOME/.config/gcloud/configurations/config_$active_config 2>/dev/null)
        if test -n "$project_id"
            set gcp_info (set_color -b black)" "(set_color white)"gcp: $project_id "(set_color normal)
        end
    end

    echo (set_color blue)$cwd(set_color normal) $git_info $kube_info $gcp_info
    echo (set_color magenta)">"(set_color normal)" "
end
