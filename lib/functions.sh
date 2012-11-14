# 
# Shell functions for rundeck commands
#


# Read rerun's public functions
. $RERUN || {
    echo >&2 "ERROR: Failed sourcing rerun function library: \"$RERUN\""
    return 1
}


# ----------------------------
# Your functions declared here.
#

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
