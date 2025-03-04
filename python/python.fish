## -*- mode: fish -*- ##

# This  should be unnecessary now that truststore is a thing.
if [ -r /etc/ssl/cacerts.pem ]
    # For requests library until 3.0 ships
    set -gx REQUESTS_CA_BUNDLE /etc/ssl/cacerts.pem

    # For regular python urllib <sigh>
    set -gx SSL_CERT_FILE /etc/ssl/cacerts.pem
end

# Prevent pip and sometimes pyenv from making a mess of things.
# If I need it globably, I have to unset the variable.
set -gx PIP_REQUIRE_VIRTUALENV true

# PipX installs everything in ~/.local/bin
fish_add_path --global --move --path ~/.local/bin


## EOF ##
