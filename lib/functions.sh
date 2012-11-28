# Shell functions for the mymodule module.
#/ usage: source RERUN_MODULE_DIR/lib/functions.sh command
#

# Read rerun's public functions
. $RERUN || {
    echo >&2 "ERROR: Failed sourcing rerun function library: \"$RERUN\""
    return 1
}

# Check usage. Argument should be command name.
[[ $# = 1 ]] || rerun_option_usage

# Source the option parser script.
#
if [[ -r $RERUN_MODULE_DIR/commands/$1/options.sh ]] 
then
    . $RERUN_MODULE_DIR/commands/$1/options.sh || {
        rerun_die "Failed loading options parser."
    }
fi

# - - -
# Your functions declared here.
# - - -

#
# login to rundeck using miserable cookie
#
doLogin() {
    url="$1"
    username="$2"
    password="$3"
    cookieFile="$4"


    curlTmp="$(mktemp)"
    loginurl="${url}/j_security_check"
    CURLOPTS="-s -S -L -c ${cookieFile} -b ${cookieFile}"
    CURL="curl $CURLOPTS"
    if ! $CURL $url > "${curlTmp}"
    then
       echo "failed login request using url: ${url}" 1>&2
       return 1
    fi

    if ! $CURL -X POST -d j_username="${username}" -d j_password="${password}" "${loginurl}" > "${curlTmp}"
    then
       echo "failed POST of credentials using url: ${loginurl}" 1>&2
       return 1
    fi

    if grep 'j_security_check' -q "${curlTmp}"
    then
       echo "failed login using url: ${loginurl}" 1>&2
       return 1
    fi

    rm -f "${curlTmp}"

}
