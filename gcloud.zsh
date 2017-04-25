setopt prompt_subst
autoload -Uz add-zsh-hook

function() {
    local mtime_fmt

    # handle difference of stat between GNU and BSD
    if stat --help >/dev/null 2>&1; then
        mtime_fmt='-c%y'
    else
        mtime_fmt='-f%m'
    fi
    zstyle ':zsh-gcloud-prompt:' mtime_fmt $mtime_fmt
}

function _set_zsh_gcloud_prompt() {
    local account project

    account="$(gcloud config get-value account 2>/dev/null)"
    project="$(gcloud config get-value project 2>/dev/null)"

    ZSH_GCLOUD_PROMPT="${account}:${project}"
}

function _is_gcloud_config_updated() {
    local active_config config_default configurations
    local active_config_now config_default_now configurations_now
    local active_config_mtime config_default_mtime configurations_mtime mtime_fmt

    # if one of these files is modified, assume gcloud configuration is updated
    active_config="$HOME/.config/gcloud/active_config"
    config_default="$HOME/.config/gcloud/configurations/config_default"
    configurations="$HOME/.config/gcloud/configurations"

    zstyle -s ':zsh-gcloud-prompt:' mtime_fmt mtime_fmt

    active_config_now="$(stat $mtime_fmt $active_config 2>/dev/null)"
    config_default_now="$(stat $mtime_fmt $config_default 2>/dev/null)"
    configurations_now="$(stat $mtime_fmt $configurations 2>/dev/null)"

    zstyle -s ':zsh-gcloud-prompt:' active_config_mtime active_config_mtime
    zstyle -s ':zsh-gcloud-prompt:' config_default_mtime config_default_mtime
    zstyle -s ':zsh-gcloud-prompt:' configurations_mtime configurations_mtime

    if [[ "$active_config_mtime" != "$active_config_now" || "$config_default_mtime" != "$config_default_now" || "$configurations_mtime" != "$configurations_now" ]]; then
        zstyle ':zsh-gcloud-prompt:' active_config_mtime "$active_config_now"
        zstyle ':zsh-gcloud-prompt:' config_default_mtime "$config_default_now"
        zstyle ':zsh-gcloud-prompt:' configurations_mtime "$configurations_now"
        return 0
    else
        return 1
    fi
}

function _update_gcloud_prompt() {
    if _is_gcloud_config_updated; then
        _set_zsh_gcloud_prompt
    fi

    return 0
}

add-zsh-hook precmd _update_gcloud_prompt

_update_gcloud_prompt
