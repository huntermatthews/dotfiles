if is_work ; then
    # For requests library until 3.0 ships
    export REQUESTS_CA_BUNDLE=/etc/ssl/cacerts.pem
    # For regular python urllib <sigh>
    export SSL_CERT_FILE=/etc/ssl/cacerts.pem
fi

# This  should be unnecessary now that truststore is a thing.

