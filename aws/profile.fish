# -*- mode: fish -*-

function awsauth
    set creds (echo $argv | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

    string join \n $creds >~/.aws/credentials

    # Grab first line and assign that to AWS_PROFILE to allow easy-ish switching
    set -gx AWS_PROFILE (echo $creds[1] | sed -e 's/\[\(.*\)\]$/\1/')
    echo $AWS_PROFILE
    aws sts get-caller-identity | cat
end

# EOF
