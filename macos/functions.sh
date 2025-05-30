!#/usr/bin/env sh

# Load GPG agent
function gpg_cache () {
    gpg-connect-agent /bye &> /dev/null # 1
    eval $(op signin) # 2
    op get item vmgevmdnbbuui3evhksdftjhju --fields password | /usr/lib/gnupg2/gpg-preset-passphrase --preset 80160C5055DA07978E939C0575A4E8DA0B1ECF27 # 3
}
gpg_cache # 4
