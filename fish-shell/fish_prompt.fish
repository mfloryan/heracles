# Prompt configuration for the Fish Shell - by Marcin Floryan

# The main shell prompt
function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	if not set -q __fish_git_prompt_show_informative_status
		set -g __fish_git_prompt_show_informative_status 1
	end
	if not set -q __fish_git_prompt_hide_untrackedfiles
		set -g __fish_git_prompt_hide_untrackedfiles 1
	end

	if not set -q __fish_git_prompt_color_branch
		set -g __fish_git_prompt_color_branch magenta --bold
	end
	if not set -q __fish_git_prompt_showupstream
		set -g __fish_git_prompt_showupstream "informative"
	end
	if not set -q __fish_git_prompt_char_upstream_ahead
		set -g __fish_git_prompt_char_upstream_ahead "↑"
	end
	if not set -q __fish_git_prompt_char_upstream_behind
		set -g __fish_git_prompt_char_upstream_behind "↓"
	end
	if not set -q __fish_git_prompt_char_upstream_prefix
		set -g __fish_git_prompt_char_upstream_prefix ""
	end

	if not set -q __fish_git_prompt_char_stagedstate
		set -g __fish_git_prompt_char_stagedstate "●"
	end
	if not set -q __fish_git_prompt_char_dirtystate
		set -g __fish_git_prompt_char_dirtystate "✚"
	end
	if not set -q __fish_git_prompt_char_untrackedfiles
		set -g __fish_git_prompt_char_untrackedfiles "…"
	end
	if not set -q __fish_git_prompt_char_conflictedstate
		set -g __fish_git_prompt_char_conflictedstate "✖"
	end
	if not set -q __fish_git_prompt_char_cleanstate
		set -g __fish_git_prompt_char_cleanstate "✔"
	end

	if not set -q __fish_git_prompt_color_dirtystate
		set -g __fish_git_prompt_color_dirtystate blue
	end
	if not set -q __fish_git_prompt_color_stagedstate
		set -g __fish_git_prompt_color_stagedstate yellow
	end
	if not set -q __fish_git_prompt_color_invalidstate
		set -g __fish_git_prompt_color_invalidstate red
	end
	if not set -q __fish_git_prompt_color_untrackedfiles
		set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
	end
	if not set -q __fish_git_prompt_color_cleanstate
		set -g __fish_git_prompt_color_cleanstate green --bold
	end

	set -l path_colour (set_color -o cyan)
	set -l normal (set_color normal)
	set -l user_colour (set_color -o green)

	echo -n -s $user_colour " " (whoami) ": "

	set -l cwd $path_colour(basename (prompt_pwd))

	echo -n -s $cwd $normal

	printf '%s' (__fish_vcs_prompt)
	if [ "$last_status" -ne 0 ]
		set_color red
	end
	echo -n -s ' » ' $normal
end

# Prompt on the right side
function fish_right_prompt --description 'Add some nice prompt of the right'
  set -l last_status $status

  set_color normal

  __show_cmd_duration
	__show_cmd_status $last_status
	__show_current_date
 
  set_color normal
end


function __show_cmd_duration --description 'Show command duration' --no-scope-shadowing

	[ -z "$CMD_DURATION" -o "$CMD_DURATION" -lt 100 ]; and return

	echo -ns '> '

  if [ "$CMD_DURATION" -lt 5000 ]
  	set_color normal
    echo -ns $CMD_DURATION 'ms'
  else if [ "$CMD_DURATION" -lt 60000 ]
    set_color yellow
    __pretty_ms $CMD_DURATION s
  else if [ "$CMD_DURATION" -lt 3600000 ]
    set_color red
    __pretty_ms $CMD_DURATION m
  else
    set_color red
    __pretty_ms $CMD_DURATION h
  end

  
end

function __show_cmd_status --no-scope-shadowing --argument exit_status 

  # print last exit code if nonzero:
  if [ "$exit_status" -ne 0 ];
  	set_color $fish_color_normal
  	echo -n "["
    set_color -o red
    printf '%d' $exit_status
    set_color $fish_color_normal
    echo -n "]"
  end
end

function __show_current_date
	 # Show date 
  set -q prompt_date_format
    or set -l prompt_date_format "+%c"

  set_color $fish_color_autosuggestion

  echo -n ' '
  date $prompt_date_format
end

function __pretty_ms --no-scope-shadowing --argument ms interval --description 'Millisecond formatting for humans'
	set -l interval_ms
	set -l scale 1

  switch $interval
    case s
      set interval_ms 1000
    case m
      set interval_ms 60000
    case h
      set interval_ms 3600000
      set scale 2
  end

  math -s$scale "$ms/$interval_ms" | string replace -r '\\.?0*$' $interval
end
