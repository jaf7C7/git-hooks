# Don't allow commits to master branch.

default_branch=$(git config --get init.defaultBranch)
current_branch=$(git branch --show-current)

if test "$current_branch" = "$default_branch"
then
	echo "Cannot commit directly to $current_branch."
	echo 'Commit changes in a new branch and merge it in.'
	return 1
fi
