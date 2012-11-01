. ~/.zsh/config
. ~/.zsh/aliases

# Add the following to your ~/.bashrc or ~/.zshrc
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

voice() {
  if [ $# -lt 1 ]; then
    echo "USAGE: $0 [text] [lang]"
    return
  fi
  value="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$1")"
  lang=${2:-"de"}
  url="http://translate.google.de/translate_tts?ie=UTF-8&q=$value&tl=$lang&total=1&idx=0&textlen=19&prev=input"
  file="/tmp/voice.mp3"
  wget -q -U "Mozilla/5.0" -O $file $url && afplay $file && rm $file
}

stinkt() {
  $(voice "$1 stinkt")
}
