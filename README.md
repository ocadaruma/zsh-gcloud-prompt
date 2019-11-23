# zsh-gcloud-prompt
Show current gcloud config in zsh prompt.

This script is inspired by [zsh-kubectl-prompt](https://github.com/superbrothers/zsh-kubectl-prompt).

![capture](https://github.com/ocadaruma/zsh-gcloud-prompt/blob/master/capture.png)

## Installation
### Normal Way
#### 1. Check out the repository.

```
$ git clone https://github.com/ocadaruma/zsh-gcloud-prompt.git /path/to/zsh-gcloud-prompt
```

#### 2. Configure your zsh

Current gcloud config is stored in `ZSH_GCLOUD_PROMPT`. (in the form of `"${active-account}:${active-project}"`)

For example, add following lines to `~/.zshrc`

```
autoload -Uz colors; colors
source /path/to/zsh-gcloud-prompt/gcloud.zsh
RPROMPT='%{$fg[cyan]%}($ZSH_GCLOUD_PROMPT)%{$reset_color%}'
```
### Oh My ZSH Way
If you use [oh-my-zsh](https://ohmyz.sh/), load this repository as follows:

1. Clone the repo into oh-my-zsh custom plugins folder

```sh
git clone git@github.com:ocadaruma/zsh-gcloud-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-gcloud-prompt
```

2. Activate the plugin your `.zshrc` by appending it to the plugin section

```sh
plugins=( [plugins...] zsh-gcloud-prompt)
```

> **Note:** Remember to source the `.zshrc` or restart your shell after step 2
