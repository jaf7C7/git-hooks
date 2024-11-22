# Git Hooks

These hooks are intended to be sourced by git hooks scripts.  Since each hook
is executed in the same shell environment, variables and functions set in the
hooks are unset before returning from the hook.  Hooks use `return` instead of
`exit` to stop executing the hook while not exiting from the parent shell.  The
value returned by the `return` builtin gives the return value for the `.`
(source) command.

## How to use

An example `.git/hooks/pre-commit` file:

```shell
#!/bin/sh

: "${GIT_HOOKS:=$HOME/Projects/git-hooks}"

# Exit (and abort the commit) if any hook returns failure.
set -e

# Don't allow commits to the branch given by config option `init.defaultBranch`
# (defaults to `master`).
. "$GIT_HOOKS/pre-commit/no_commit_to_master.sh"

# Format all staged python files with `black`.
. "$GIT_HOOKS/pre-commit/formatters/black.sh"
```
