alias g='git'

alias ga='git add'

alias gsb='git status -sb'

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gc='git commit -v'
alias gca='git commit -v -a'

alias gco='git checkout'

alias gpu='git push'
alias gpl='git pull'
alias gpuuo='git push --set-upstream origin $(git_current_branch)'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase origin/$(git_main_branch) -i'
