function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    fish_vi_key_bindings

    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias pamcan pacman
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'

    alias c='clear'
    alias podlp='yt-dlp -o "~/.porn/%(title)s[%(webpage_url)s].%(ext)s" '
    alias podl='youtube-dl -o "~/.porn/%(channel)s/%(title)s[%(id)s].%(ext)s"'
    alias mvdl='youtube-dl -o "~/Videos/YT/MVs/%(title)s.%(ext)s" --sub-lang en --sub-format srt --write-sub'
    alias mvdlp='yt-dlp -o "~/Videos/YT/MVs/%(title)s.%(ext)s" --sub-lang en --sub-format srt --write-sub'
    alias gdl='gallery-dl'
    alias ydlp='yt-dlp -o "~/Videos/YT/%(channel)s/%(title)s.%(ext)s" --sub-lang en --sub-format srt --write-sub'
    alias ydl='youtube-dl -o "~/Videos/YT/%(channel)s/%(title)s.%(ext)s" --sub-lang en --sub-format srt --write-sub'
    alias px='proxychains4'
    alias pxq='proxychains4 -q'
    alias spdl='spotdl -o ~/Music/Spotdl --output-format opus'
    alias ypdl='youtube-dl -o "~/Videos/YT/%(channel)s/%(playlist)s/%(playlist_index)02d. %(title)s.%(ext)s" --sub-lang en --sub-format srt --write-sub'
    alias ypdlp='yt-dlp -o "~/Videos/YT/%(channel)s/%(playlist)s/%(playlist_index)02d. %(title)s.%(ext)s" --sub-lang en --sub-format srt --write-sub'
    alias yp='yt-dlp'

    alias m2o='fd -a --glob "*.mp3" | parallel --max-args 1 "ffmpeg -vsync 2 -i {} -f flac -map_metadata 0 - |opusenc  --bitrate 128  - {.}.opus;touch -r {} {.}.opus;rm -vf {}"'
    alias ffmpeg='ffmpeg -hide_banner'
    alias ffprobe='ffprobe -hide_banner'
    alias yaye='yay --editmenu --mflags --skipinteg'
    alias gitc1='git clone --depth 1'
    alias dolphinr='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY KDE_SESSION_VERSION=5 KDE_FULL_SESSION=true dbus-launch dolphin &>/dev/null &'
    alias systemsettingsr='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY KDE_SESSION_VERSION=5 KDE_FULL_SESSION=true dbus-launch systemsettings &>/dev/null &'
    alias kater='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY KDE_SESSION_VERSION=5 KDE_FULL_SESSION=true dbus-launch kate &>/dev/null &'
    alias qr='qrencode -m 2 -t utf8'
    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    alias dot=dotfiles

    alias pkexec='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'
    # Fedora
    alias dnfi='sudo dnf install'
    alias dnfr='sudo dnf remove'
    alias dnfu='sudo dnf update'
    alias dnfs='dnf search'
    alias sp='export HTTP_PROXY=http://127.0.0.1:10808 && export HTTPS_PROXY=$HTTP_PROXY&& export http_proxy=$HTTP_PROXY && export https_proxy=$HTTP_PROXY'
    alias diff="kitten diff"
    alias icat="kitten icat"
    alias kssh="kitten ssh --kitten login_shell=fish"
    alias ksshb="kitten ssh"
    alias myip="curl -s https://api.ipify.org"

    function csp
      export HTTP_PROXY=$argv && export HTTPS_PROXY=$HTTP_PROXY&& export http_proxy=$HTTP_PROXY && export https_proxy=$HTTP_PROXY
    end
    function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
    end

end

source ~/.config/.env
source ~/.config/fish/colorized.fish
