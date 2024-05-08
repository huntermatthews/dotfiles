# from zshuery or something


is_mac() { [[ $OSTYPE == darwin* ]] }
is_linux() { [[ $OSTYPE == linux* ]] }

# This one figures out if I'm at work
# I need this to be more sophisticated, and maybe hide where I work.
# but sufficient for now..
is_work() { [[ ${HOSTNAME} == 'HG-02254242-LM' ]] }




## END OF LINE ##
