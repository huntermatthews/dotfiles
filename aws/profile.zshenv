awsauth() {
    creds=$(echo "$@" | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')
    echo "${creds}" > ~/.aws/credentials
    # GRab first line and assign that to AWS_PROFILE to allow easy-ish switching
    export AWS_PROFILE=$(echo ${creds} | sed -n 1p | sed -e 's/\[\(.*\)\]$/\1/')
    echo $AWS_PROFILE
    aws sts get-caller-identity | cat
}

