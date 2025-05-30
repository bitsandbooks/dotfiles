#!/usr/bin/env sh

# Load GPG agent
function gpg_cache () {
    gpg-connect-agent /bye &> /dev/null # 1
    eval $(op signin) # 2
    op item get $OP_GPG_PASSPHRASE --fields password | /usr/lib/gnupg2/gpg-preset-passphrase --preset $GPG_KEY_FOR_OP_TO_UNLOCK # 3
}
gpg_cache # 4
