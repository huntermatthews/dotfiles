## -*- mode: fish -*- ##

# Helper aliases for SSH. Should only need on reboots...
alias ssh-card-add "ssh-add -s /usr/lib/ssh-keychain.dylib"
alias ssh-card-remove "ssh-add -e /usr/lib/ssh-keychain.dylib"
alias ssh-add-all "ssh-add --apple-load-keychain ; ssh-card-add"

# Its _almost_ always the first key. If pkcs15-tool says "PIV Auth pubkey" you got it right.
if command -v pkcs15-tool >/dev/null 2>&1
    alias ssh-card-list "pkcs15-tool --read-ssh-key 01"
else
    alias ssh-card-list "ssh-keygen -D /usr/lib/ssh-keychain.dylib 2>/dev/null | head -n 1 "
end

## END OF LINE ##
