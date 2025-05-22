if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
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
  fish_vi_key_bindings
  alias qr='qrencode -m 2 -t utf8'
  alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

  alias pkexec='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'
  # Fedora
  alias dnfi='sudo dnf install'
  alias dnfr='sudo dnf remove'
  alias dnfu='sudo dnf update'
  alias dnfs='dnf search'
  alias sp='export HTTP_PROXY=http://127.0.0.1:10808 && export HTTPS_PROXY=$HTTP_PROXY&& export http_proxy=$HTTP_PROXY && export https_proxy=$HTTP_PROXY'

  function csp
    export HTTP_PROXY=$argv && export HTTPS_PROXY=$HTTP_PROXY&& export http_proxy=$HTTP_PROXY && export https_proxy=$HTTP_PROXY
  end
end


# pnpm
set -gx PNPM_HOME "/home/rylan/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
source ~/.config/.env


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/rylan/.opam/opam-init/init.fish' && source '/home/rylan/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/rylan/.lmstudio/bin
