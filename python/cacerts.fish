## -*- mode: fish -*- ##

# This should be unnecessary now that truststore is a thing... but compatibility!
if [ -r /etc/ssl/cacerts.pem ]
    # For requests library until 3.0 ships
    set -gx REQUESTS_CA_BUNDLE /etc/ssl/cacerts.pem

    # For regular python urllib <sigh>
    set -gx SSL_CERT_FILE /etc/ssl/cacerts.pem
end

## END OF LINE ##
