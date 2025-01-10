set -l foreground c0caf5
    set -l selection 283457
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
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
#fm6000 --file ~/logo.txt --color red
#alias fm6000="fm6000 --file ~/logo.txt --color red"
# alias neofetch="neofetch --source ~/.config/neofetch/logo"
#neofetch
echo " "
alias fetch="pokeget scizor --hide-name | fastfetch --file-raw -"
alias mgba="mgba.sh"
pokeget random --hide-name
echo " "
alias ls="exa --icons --color=always --group-directories-first"
alias swaylock="swaylock --indicator-idle-visible -F -e --indicator-thickness 15 --inside-color 423732 --inside-wrong-color 533434 --layout-border-color 211915 --layout-bg-color 211915 --line-color 211915 --ring-color 211915 --key-hl-color 737942 --text-color d4be98 --text-wrong-color d4be98"
alias pipes="pipes.sh"
alias thsc="launch-thsc.sh"
alias powermenu="rofi -show power-menu -modi power-menu:rofi-power-menu"
alias unimatrix="unimatrix -s 96 -c magenta"
alias legacy-launcher="legacy-launcher.sh"
export XCURSOR_THEME="Bibata-Modern-Classic"
export TERM=xterm-256color
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
#export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORMTHEME=qt6ct
starship init fish | source
zoxide init fish | source
