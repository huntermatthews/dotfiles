#! /bin/zsh

prj() {
    export PROJECT PROJECT_DIR

    case "$1" in
        go)
            cd $PROJECT_DIR
            ;;
        reset)
            source ~/.project
            prj set $PROJECT
            prj go 
            ;;
        set)
            PROJECT="$2"
            PROJECT_DIR=~/projects/${PROJECT}
            echo "PROJECT=\"${PROJECT}\"" > ~/.project
            ;;
        view)
            # view could be in backend(), but its just one echo statement...
            echo ${PROJECT}
            ;;
        *)
            ~/bin/project.zsh backend "$@"
            ;;
    esac
}

backend() {
    case "$1" in
        build)
            shift 
            case "$1" in
                *.spec)
#                    mock --no-clean --resultdir $PROJECT_DIR/MOCK \
#                        --buildsrpm --sources SOURCES --spec $@
                    mock --no-clean --resultdir $PROJECT_DIR/MOCK \
                        --buildsrpm --sources $(dirname $1) --spec $@ >/tmp/mocklog
                    if [[ $? == 0 ]] ; then
                        srcrpm=$(grep Wrote /tmp/mocklog | sed -e 's|^.*/||g')
                        mock --no-clean --resultdir $PROJECT_DIR/MOCK \
                            $PROJECT_DIR/MOCK/$srcrpm
                        rm -f /tmp/worklog
                    fi
                    if [[ $? == 0 ]]; then
                        echo 'run rpmlint now?'
                    fi
                    ;;
                *.src.rpm)
                    mock --no-clean --resultdir $PROJECT_DIR/MOCK $@
                    ;;
                *)
                    echo "ERROR: unrecognized project request. Please shoot gerbil"
                    exit 1
                    ;;
            esac
            ;;
        debug)
            for x in "$@" ; do
                echo $x
            done
            ;;
        destroy)
            rm -rf ${PROJECT_DIR}
            ;;
        help)
            echo "should print help here"
            ;;
        ls)
            case "$2" in 
                '')
                    ls -1 ~/projects
                    ;;
                *)
                    cd ~/projects
                    ls -1d $2/* | grep -v -e BUILD -e RPMS -e SOURCES -e MOCK
                    ;;
            esac
            ;;
        new)
            mkdir -p ~/projects/${PROJECT}/{BUILD,RPMS,SOURCES,MOCK}
            ;;
        usage)
            echo "should print usage here"
            ;;
        *)
            echo "ERROR: sub-command not recognized"
            exit 1
            ;;
    esac
}

# main()
if [[ $1 == 'backend' ]]; then
    shift # get rid of the word "backend" itself
    backend "$@"
else
    if [[ -z $PROJECT && -f ~/.project ]]; then
        prj reset
    fi
    unfunction backend
fi

## END OF LINE ##
