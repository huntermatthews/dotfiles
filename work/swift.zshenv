## Only available on corp and lighthouse

dotfiles_debug SWIFT_ACCT $SWIFT_ACCT

case $SWIFT_ACCT in 
    thmadmin ) 
        ST_AUTH=https://swift.thefacebook.com/auth/v1.0
        ST_USER=thmadmin
#        ST_KEY="faceb00c"
        ;;
    images )
        ST_AUTH=https://swift.thefacebook.com/auth/v1.0
        ST_USER=images
        ST_KEY="swift_images"
        ;;
    thm | * )
        ST_AUTH=https://swift.thefacebook.com/auth/v1.0
        ST_USER=thm
#        ST_KEY="faceb00c"
        ;;
esac

export ST_AUTH ST_USER ST_KEY

## END OF LINE ##

