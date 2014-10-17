#!/bin/bash
#
# eval this file in bash, and provide arguments to set the environment
# variables for building or running omero.
#
# Example: setup the environment for ice 3.4.2 Java 1.6
#   $ eval $(multi-config.sh ice342 java6)
#   $ echo $ICE_HOME
#   $ echo $JAVA_HOME
#   $ echo $PYTHONPATH
#   $ echo $PATH
#   $ echo $LD_LIBRARY_PATH
#

set -e

declare -A EXPORTVARS
prepend_path() {
    VAR="$1"
    PRE="$2"
    eval CURRENT="\"\$$VAR\""
    if [ -n "$CURRENT" ]; then
        eval $VAR="\"$PRE:$CURRENT\""
    else
        eval $VAR="\"$PRE\""
    fi
    eval "EXPORTVARS[$VAR]=\"$(eval 'echo "\$$VAR"')\""
}

omero_env() {
    # Remove - and . when matching
    IV="${1//[-.]/}"
    case "$IV" in
        ice33 | ice331 )
            ICE_VERSION=3.3.1
            ;;

        ice34 | ice342 )
            ICE_VERSION=3.4.2
            ;;

        ice350 )
            ICE_VERSION=3.5.0
            ;;

        ice35 | ice351 )
            ICE_VERSION=3.5.1
            ;;

        java6 )
            JAVA_VERSION=1.6.0
            ;;

        java7 )
            JAVA_VERSION=1.7.0
            ;;

        python26 )
            PYTHON_VERSION=2.6.6
            ;;

        python27 )
            PYTHON_VERSION=2.7.5
            ;;

        * )
            echo "ERROR: Unknown environment option: $1" >&2
            # This ensures the eval returns non-zero
            echo false
            exit 1
            ;;
    esac

    return 0
}

while [ $# -gt 0 ]; do
    omero_env "$1"
    shift
done

if [ -n "$ICE_VERSION" ]; then
    ICE_HOME=/opt/ice/ice-$ICE_VERSION
    echo export ICE_HOME=\"$ICE_HOME\"
    echo export ICE_VERSION=\"$ICE_VERSION\"
    prepend_path PYTHONPATH "$ICE_HOME/python"
    prepend_path PATH "$ICE_HOME/bin"
    prepend_path LD_LIBRARY_PATH "$ICE_HOME/lib64"
    prepend_path LIBPATH "$ICE_HOME/lib64"
fi

if [ -n "$JAVA_VERSION" ]; then
    JAVA_HOME=/usr/lib/jvm/java-$JAVA_VERSION
    echo export JAVA_HOME=\"$JAVA_HOME\"
    echo export JAVA_VERSION=\"$JAVA_VERSION\"
    prepend_path PATH "$JAVA_HOME/bin"
fi

if [ -n "$PYTHON_VERSION" ]; then
    if [ "$PYTHON_VERSION" = 2.7.5 ]; then
        # cat /opt/rh/python27/enable 
        prepend_path PATH /opt/rh/python27/root/usr/bin
        prepend_path LD_LIBRARY_PATH /opt/rh/python27/root/usr/lib64
    else
        prepend_path PATH "/usr/bin"
    fi
fi

for var in "${!EXPORTVARS[@]}"; do
    echo export "$var=\"$(eval 'echo "${EXPORTVARS[$var]}"')\""
done
