
# Hunter - combine the color choices and automatic width caluculations of the first with the ... mostly simpler code
# of the second. Call it msg_box or rounded_box() -- either works.


if (( BASH_VERSINFO[0] < 3 || ( BASH_VERSINFO[0] == 3 && BASH_VERSINFO[1] < 1 ) )); then
    printf '%s\n' 'BASH version required >= 3.1 (released 2005)' 1>&2
    exit 1
fi

msg_box() {
    # Note: Header will not line wrap
    local msg_max_len msg_lines msg_line msg_line_len msg_line affix spaces \
        header_text=$1 \
        msg_text=${2//$'\t'/  }$'\n' \
        msg_line_longest=0 \
        color_main=$'\e[38;5;007m' # white \
        color_border=$'\e[38;5;142m' # yellow

    shopt -s checkwinsize; (:)
    : "${COLUMNS:=$(tput cols)}"
    msg_max_len=$(( COLUMNS - 8 ))

    msg_lines=()
    while [[ $msg_text ]]; do
        msg_line=${msg_text%%$'\n'*}
        msg_line_len=${#msg_line}

        if (( msg_line_len > msg_max_len )); then
            while [[ $msg_line ]]; do
                affix=${msg_line:0:$msg_max_len}
                msg_line=${msg_line:msg_max_len}
                if (( ${#affix} == msg_max_len )) && [[ ${affix: -1} != ' ' ]] && [[ ${affix} == *' '* ]]; then
                    msg_line=${affix##* }$msg_line
                    affix=${affix% *}
                fi
                msg_lines+=("$affix")
            done
            msg_line_longest=$msg_max_len
        else
            msg_lines+=("$msg_line")
            (( msg_line_len > msg_line_longest )) && msg_line_longest=$msg_line_len
        fi

        [[ $msg_text == *$'\n'* ]] || break
        msg_text=${msg_text#*$'\n'}
    done

    (( ${#header_text} > msg_line_longest )) && msg_line_longest=${#header_text}

    printf -v spaces %*s "$(( msg_line_longest - ${#header_text} ))"
    printf "${color_border}╭ %s %s────╮\n" "${header_text}" "${spaces// /─}" 1>&2
    for msg_line in "${msg_lines[@]}"; do
        printf "│   ${color_main}%s${color_border}%*s   │\n" "$msg_line" "$(( msg_line_longest - ${#msg_line} ))" 1>&2
    done
    printf -v spaces '%*s' "$msg_line_longest"
    printf "╰───%s───╯\n" "${spaces// /─}" 1>&2
}

msg_box 'my header' 'first line

Bash is the GNU Projects aaa shell—the Bourne Again SHell. This is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh).

last line'

rounded_box() {
    local u_left u_right b_left b_right h_bar v_bar h_width title content
    u_left="\xe2\x95\xad"   # upper left corner
    u_right="\xe2\x95\xae"  # upper right corner
    b_left="\xe2\x95\xb0"   # bottom left corner
    b_right="\xe2\x95\xaf"  # bottom right corner
    h_bar="\xe2\x94\x80"    # horizontal bar
    v_bar="\xe2\x94\x82"    # vertical bar
    h_width="78"            # default horizontal width

    # Reset OPTIND
    OPTIND=1

    while getopts ":ht:w:" flags; do
        case "${flags}" in
            (h)
                printf -- '%s\n' "rounded_box (-t [title] -w [width in columns]) [content]" >&2
                return 0
            ;;
            (t) title="${OPTARG}" ;;
            (w) h_width="$(( OPTARG - 4 ))" ;;
            (*) : ;;
        esac
    done
    shift "$(( OPTIND - 1 ))"

    # What remains after getopts is our content
    # We store it this way to support multi-line input
    content=$(printf -- '%s ' "${@}")

    # Print our top bar
    printf -- '%b' "${u_left}"
    # If the title is defined, then make space for it within the top bar
    if [[ -n "${title}" ]]; then
        # Calculate visual width of title (accounting for UTF-8)
        title_visual_width=$(printf -- '%s' "${title}" | wc -m)
        title_padding=$(( h_width - title_visual_width - 2 ))
        
        printf -- '%b %s ' "${h_bar}" "${title}"
        for (( i=0; i<title_padding; i++)); do
            printf -- '%b' "${h_bar}"
        done
    # Otherwise, just print the full bar
    else
        for (( i=0; i<h_width; i++)); do
            printf -- '%b' "${h_bar}"
        done
    fi
    printf -- '%b\n' "${h_bar}${u_right}"

    # Print our content
    if [[ -n "${content}" ]]; then
        # Replace literal "\n" with actual newlines
        processed_content=$(printf -- '%s' "${content}" | sed 's/\\n/\n/g')
        
        # Process each line, including empty lines
        while IFS= read -r line || [[ -n "${line}" ]]; do
            # Wrap long lines with fold
            while IFS= read -r folded_line; do
                line_visual_width=$(printf -- '%s' "${folded_line}" | wc -m)
                padding_width=$(( h_width - line_visual_width ))
                printf -- '%b %s' "${v_bar}" "${folded_line}"
                printf -- '%*s' "$padding_width"
                printf -- ' %b\n' "${v_bar}"
            done < <(printf '%s\n' "${line}" | fold -s -w "${h_width}")
        done < <(printf -- '%s\n' "${processed_content}")
    else
        # Empty content - print one blank line
        printf -- '%b %*s %b\n' "${v_bar}" "$h_width" "" "${v_bar}"
    fi

    # Print our bottom bar
    printf -- '%b' "${b_left}${h_bar}"
    for (( i=0; i<h_width; i++)); do
        printf -- '%b' "${h_bar}"
    done
    printf -- '%b\n' "${h_bar}${b_right}"
}

rounded_box -t Warning -w $COLUMNS "Ignored build scripts: bcrypt, sharp.\nRun \"pnpm approve-builds\" to pick which dependencies should be allowed to run scripts."

