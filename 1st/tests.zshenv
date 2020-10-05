# from zshuery or something


is_mac() { [[ $OSTYPE == darwin* ]] }
is_freebsd() { [[ $OSTYPE == freebsd* ]] }
is_linux() { [[ $OSTYPE == linux* ]] }

# This one figures out if I'm at work
# I need this to be more sophisticated, and maybe hide where I work.
# but sufficient for now..
is_work() { [[ ${HOSTNAME} == *'nih.gov' ]] }




## END OF LINE ##
