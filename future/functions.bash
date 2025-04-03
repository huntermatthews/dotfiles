



## Helper Functions
debug() {
    if [[ $DEBUG == "TRUE" ]] ; then
        printf "DEBUG: %s\n" "$@" >&2
    fi
}

error() {
    printf "ERROR: %s\n" "$@" >&2
}

timestamp() {
    # macos does not have --rfc-3339
    printf '%s %s\n' "$@" "$(date -Iseconds)"
}
