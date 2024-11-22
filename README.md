# Git Hooks

These executables are intended to be modular, and run from your repository's
git hooks scripts.

## How to use

An example `.git/hooks/pre-commit` file:

```shell
#!/bin/sh

: "${GIT_HOOKS:=$HOME/Projects/git-hooks}"

# Exit (and abort the commit) if any hook returns failure.
set -e

# Don't allow commits to the branch given by config option `init.defaultBranch`
# (defaults to `master`).
"$GIT_HOOKS/pre-commit/no_commit_to_master"

# Format all staged python files with `black`.
"$GIT_HOOKS/pre-commit/formatters/black"
```
