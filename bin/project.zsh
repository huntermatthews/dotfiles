#! /bin/zsh

project() {
    export PROJECT

    case "$1" in
        go)
            cd $PROJECT_DIR
            ;;
        reset)
            source ~/.project
            project set $PROJECT
            ;;
        set)
            PROJECT="$2"
            PROJECT_DIR=~/rpmbuild/${PROJECT}
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
        debug)
            for x in "$@" ; do
                echo $x
            done
            ;;
        build)
            case "$2" in
                *.spec)
                    mock --no-clean --resultdir $PROJECT_DIR/mock-results \
                        --buildsrpm --sources SOURCES --spec $2
                    ;;
                *.src.rpm)
                    mock --no-clean --resultdir $PROJECT_DIR/mock-results $2
                    ;;
                *)
                    echo "ERROR: unrecognized build request. Please shoot gerbil"
                    exit 1
                    ;;
            esac
            ;;
        destroy)
            rm -rf ${PROJECT_DIR}
            ;;
        help)
            echo "should print help here"
            ;;
        new)
            mkdir -p ~/rpmbuild/${PROJECT}/{BUILD,BUILDROOT,mock-results,RPMS,SOURCES,SPECS,SRPMS}
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
        project reset
    fi
    unfunction backend
fi

## END OF LINE ##
