set -g -x fish_greeting 'Welcome Joe'

set -g __fish_git_prompt_show_informative_status
set -g __fish_git_prompt_showcolorhints
set -g __fish_git_prompt_showupstream "informative"

set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "● "
set -g __fish_git_prompt_char_dirtystate "✚ "
set -g __fish_git_prompt_char_conflictedstate '⚠️  '
set -g __fish_git_prompt_char_cleanstate "✔" 
set -g __fish_git_prompt_char_stateseparator ' | '
set -g __fish_git_prompt_char_untrackedfiles ' 🔍 '
set -g __fish_git_prompt_char_upstream_ahead ' ☝️  '
set -g __fish_git_prompt_char_upstream_behind ' 👇 '
set -g __fish_git_prompt_char_upstream_diverged ' 🚧 '
set -g __fish_git_prompt_char_upstream_equal ' 💯 '

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_cleanstate green

set -gx LS_COLORS "ow=1;34:tw=1;34:"

function fish_prompt
	set last_status $status
	set_color $fish_color_cwd

	printf '%s >' (prompt_pwd)

	set_color normal
	printf '%s ' (__fish_git_prompt)
	set_color normal
end
