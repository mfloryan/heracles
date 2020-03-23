# heracles

Some useful configuration files and defaults for working in the shell.

Inspired by DocOnDev it's time to keep my configuration synchronised.

For some real inspiration look at:
* https://github.com/DocOnDev/bash_conf
* https://github.com/ecomba/zsh_conf

## GIT

Collected `git` wisdom which may come in handy

* add all changes to the index including deletions `git add -A`
* wipe all WIP files in the working tree `git reset --hard`
* choose what bits of a file to add to the index `git add -p`
* make the history slightly cleaner by replying changes on top of a merge `git pull --rebase`

## Homebrew

```
brew tap martido/homebrew-graph
brew install graphviz
brew graph --installed --highlight-leaves | fdp -Tpng -obrew-dependency-graph.png
open brew-dependency-graph.png
```
