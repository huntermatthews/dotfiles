#! /usr/bin/env bash

# These paths must match whats in the lisp code.
# Written to be idempotent (IE, safe to run more than once and not do something stupid like 
# try to create a homedir where it can't).
cd ~
mkdir -p .emacs.d
mkdir -p .emacs.d/auto-save-list
mkdir -p .emacs.d/backups

## END OF LINE ##

