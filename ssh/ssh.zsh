alias ssh-card-add="ssh-card-remove ; ssh-add -s /usr/lib/ssh-keychain.dylib"
alias ssh-card-remove="ssh-add -e /usr/lib/ssh-keychain.dylib"
# TODO: write an "isloaded" using ssh-add -l or something

# Its _almost_ always the first key. If pkcs15-tool says "PIV Auth pubkey" you got it right.
if command -v pkcs15-tool >/dev/null 2>&1 ; then
    alias ssh-card-list="pkcs15-tool --read-ssh-key 01"
else
    alias ssh-card-list="ssh-keygen -D /usr/lib/ssh-keychain.dylib 2>/dev/null | head -n 1 "
fi

alias ssh-add-all="ssh-add --apple-load-keychain ~/.ssh/id_*~*.pub"

## END OF LINE ##
