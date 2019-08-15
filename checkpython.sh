#!/bin/bash
if command -v python &>/dev/null; then
    echo Python  is installed
    pyv="$(python -V 2>&1)"
    echo "Python version:
********************************************
     $pyv"
else
    echo Python  is not installed
fi
ver=$(python -V 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/')
if [ "$ver" -gt "24" ]; then
    echo "pass"
    else
    echo "fail"
fi
