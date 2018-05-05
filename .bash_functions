# Python virtual environment
#

pyactivate() {
    if [ "$#" -gt 0 ]; then
        env=$1
        echo "Activating python environment '$env'"
        source $PYTHON_ENVIRONMENTS/$env/bin/activate
    else
        ls -1 $PYTHON_ENVIRONMENTS | grep "/$" | sed 's%/%%g'
    fi
}
