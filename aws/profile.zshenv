export AWS_PROFILE='207348486369_NIH-AWS-SystemAdministrator-SSA'

awsauth() {
    echo "$@" > ~/.aws/credentials
    aws sts get-caller-identity
}
