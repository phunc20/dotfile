vicd()
{
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}


wifi-pass() {
    for ssid in "$@"; do
        echo $ssid
        find /etc/NetworkManager/system-connections/ -iname "*${ssid}*" | while read line
        do
            sudo grep "^psk=" "$line"
        done
        printf "\n"
    done
}


wifi-connect() {
    if [ $# -ne 1 ]; then
        echo "Require exactly one arg. Please try again."
        return 1
    fi
    result=$(nmcli device wifi connect "$1")
    err_msg=$(grep "^Error:" <(echo $result))
    if [ -n "$err_msg" ]; then
        # No password was cached for this wifi SSID before
        read -p "Password: " pass && nmcli device wifi connect "$1" password "$pass"
    else
        # Wifi successfully connected
        echo "$result"
    fi
}


pwd-to-xclip() {
    pwd | xclip -se c
}


urldecode() {
    for arg in $@; do
        local url_encoded="${arg//+/ }"
        printf '%b' "${url_encoded//%/\\x}\n"
    done
}


ext() {
    # Print all the file extensions under a certain path
    # Default: $PWD
    params=$(getopt -o :r -l recursive --name "$0" -- "$@")
    eval set -- "$params"
    unset params
    rflag=
    while true
    do
        case $1 in
            -r|--recursive)
                rflag=1
                shift
                ;;
            --)
                shift
                break
                ;;
        esac
    done
    sub='s/.*\.\+\([a-zA-Z0-9]\+\)$/\1/g'
    if [ ! -z "$rflag" ]; then
        find $1 -type f | sed $sub | sort | uniq -c | awk '{print $2 "\t" $1}'
    else
        find $1 -maxdepth 1 -type f | sed $sub | sort | uniq -c | awk '{print $2 "\t" $1}'
    fi
}


mkcd () {
  if [ "$#" -ne 1 ]
  then
    echo "Exactly one input arg is allowed."
  else
    mkdir -p "$1"
    cd "$1"
  fi
}
