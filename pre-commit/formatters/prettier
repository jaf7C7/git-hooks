# Reformats staged files with `prettier`, and prompts to review changes.

format ()
{
	for f in "$@"
	do
		shift
		case "$unformatted_files" in
		*$f*)
			set -- "$@" "$f"
		esac
	done

	if test $# -lt 1
	then
		# No staged files need formatting, so do nothing.
		return 0
	fi

	prettier --write "$@"

	# TODO: Add diff output.

	echo 'Files have been reformatted...'
	echo 'Please review changes and re-stage'

	return 1
}

staged_files=$(git diff --staged --name-only)
unformatted_files=$(prettier --list-different)

format $staged_files
