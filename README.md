# zsh-gcloud-prompt
Show current gcloud config in zsh prompt.

This script is inspired by [zsh-kubectl-prompt](https://github.com/superbrothers/zsh-kubectl-prompt).

![capture](https://github.com/ocadaruma/zsh-gcloud-prompt/blob/master/capture.png)

## Installation

#### 1. Check out the repository.

```
$ git clone https://github.com/ocadaruma/zsh-gcloud-prompt.git /path/to/zsh-gcloud-prompt
```

#### 2. Configure your zsh

Current gcloud config is stored in `ZSH_KUBECTL_PROMPT`. (in the form of `"${active-account}:${active-project}"`)

For example, add following lines to `~/.zshrc`

```
autoload -Uz colors; colors
source /path/to/zsh-gcloud-prompt/gcloud.zsh
RPROMPT='%{$fg[cyan]%}($ZSH_GCLOUD_PROMPT)%{$reset_color%}'
```
