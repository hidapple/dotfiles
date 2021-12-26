# GCP prompt configuration
function set_gcp_project() {
  if [ -f "$HOME/.config/gcloud/active_config" ]; then
    readonly local active_config=$(cat "$HOME/.config/gcloud/active_config")
    readonly local project_id=$(awk '/project/{print $3}' $HOME/.config/gcloud/configurations/config_$active_config)
    readonly local gcp_symbol='\u24bc '
    GCP_PROMPT="%K{black} gcp: $project_id %k"
  fi
}
add-zsh-hook precmd set_gcp_project
