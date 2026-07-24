# ---------------------------------------------------------------------
# Unix XDG Configuration
# ---------------------------------------------------------------------
# 
set -gx XDG_BIN_HOME "$HOME/.local/bin"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# ---------------------------------------------------------------------
# Darwin Specific stuff
# ---------------------------------------------------------------------
# 
# Darwin/Macos has a cache manager that looks here - use it
set -gx XDG_CACHE_HOME "$HOME/Library/Caches"

# Macos provides a strong $TMPDIR already - adding "runtime-UID" adds nothing on darwin.
# Its already user specific and session (login) specific. Its already 0700.
set -gx XDG_RUNTIME_DIR "$TMPDIR"


fish_add_path --global --move --path $XDG_BIN_HOME


# ---------------------------------------------------------------------
# Tool Specific Mapping, if they don't follow XDG by default
# ---------------------------------------------------------------------

# CARGO: Point Cargo binaries directly to your central XDG path
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx CARGO_INSTALL_ROOT "$XDG_BIN_HOME"

# GO: Point Go binaries directly to your central XDG path
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOBIN "$XDG_BIN_HOME"

# GNUPG
set -gx GNUPGHOME "$XDG_CONFIG_HOME/gnupg"

# LESS
set -gx LESSHISTFILE "$XDG_STATE_HOME/less_history"

# ZSH
set -gx ZDOTDIR "$XDG_CONFIG_HOME/zsh"


# ---------------------------------------------------------------------
# HomeBrew
# ---------------------------------------------------------------------
eval (/opt/homebrew/bin/brew shellenv)

set -gx HOMEBREW_NO_ENV_HINTS true


# ---------------------------------------------------------------------
# Python
# ---------------------------------------------------------------------

# This should be unnecessary now that truststore is a thing... but compatibility!
if [ -r /etc/ssl/cacerts.pem ]
    # For requests library until 3.0 ships
    set -gx REQUESTS_CA_BUNDLE /etc/ssl/cacerts.pem

    # For regular python urllib <sigh>
    set -gx SSL_CERT_FILE /etc/ssl/cacerts.pem
end

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Prevent pip and sometimes pyenv from making a mess of things.
# If I need it globably, I have to unset the variable.
set -gx PIP_REQUIRE_VIRTUALENV true


# ---------------------------------------------------------------------
# MacOS Path Cleanup
# ---------------------------------------------------------------------
#
set -l _clean_path
for _dir in (path filter -d $PATH)
    if test (count (ls "$_dir" 2>/dev/null)) -gt 0
        set -a _clean_path "$_dir"
    end
end
set -gx PATH $_clean_path
