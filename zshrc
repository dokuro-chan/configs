# ~/.zsh

# aliases
alias rop='ropg --binary'
alias viz='mpdviz -i -v spectrum'
alias yandere='wine ~/media/games/yandere/yandere'
alias ytthumb='sh ~/.scripts/ytthumb.sh'
alias traffic='sh ~/.scripts/traffic.sh'
alias rp='sh ~/.scripts/rp.sh'
alias tor='sh ~/.scripts/tor.sh'
alias bar='sh ~/.scripts/lemon.sh'
alias aes='sh ~/.scripts/aes.sh'
alias net='sudo sh ~/.scripts/net.sh'
alias webm='sh ~/.scripts/shot.sh'
alias daes='sh ~/.scripts/daes.sh'
alias 4chan='perl ~/.scripts/chan.pl'
alias fetch='sh ~/.scripts/fetch.sh'
alias imgur='sh ~/.scripts/imgur.sh'
alias dirdec='sh ~/.scripts/dirdec.sh'
alias direnc='sh ~/.scripts/direnc.sh'
alias entrop='sh ~/.scripts/entropy.sh'
alias urandkey='sh ~/.scripts/genkey.sh'
alias shellcode='sh ~/.scripts/shellcode.sh'

# check if we're in a login shell / set wallpaper
if [[ -o login ]]; then
   echo "You're in tty silly, no display open."
else
   feh --bg-fill ~/media/wallpapers/cuteaf.jpg
fi

# role based access control :3
rbac_auth() {
    local auth_to_role='cute'
    if [ "${USER}" = 'root' ]; then
        if ! grep -qE '^RBAC:' "/proc/self/status" && command -v gradm > /dev/null 2>&1; then
            echo -e "\n* RBAC - Authorize to '${auth_to_role}' RBAC role."
            gradm -a "${auth_to_role}" && exec "${SHELL}" "$@"
        fi
    fi
}
rbac_auth

NO_AT_BRIDGE=1

SAVEHIST=0
PS1="$ "
