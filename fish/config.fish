set -l foreground c0caf5
    set -l selection 283457
    set -l comment 3e4261
    set -l red eb6f92
	set -l blue 918fde 
    set -l orange ea9d34
    set -l yellow f6c177
    set -l green 4e8fb0
    set -l purple c4a7e7
    set -l cyan 9ccfd8
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal 
    set -g fish_color_command $blue
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_option $pink
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
starship init fish | source
