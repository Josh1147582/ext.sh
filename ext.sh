#!/bin/bash -e

function help () {
    echo ""
    echo "    ext.sh - mass addition/removal/toggling of file extensions"
    echo ""      
    echo "    Usage: $0 a|r extension FILE [FILE...]"
    echo "           $0 t FILE [FILE...]"
    echo ""
    echo "      Example: $0 a .ext file"
    echo "          Moves file to file.ext"
    echo ""
    echo "      Example: $0 r .ext file.ext"
    echo "          Moves file.ext to file"
    echo ""
    echo "      Example: $0 t file"
    echo "          Moves file to file.bak"
    echo ""
    echo "      Example: $0 t file.bak"
    echo "          Moves file.bak to file"
    exit 1
}
# If asking for help, display help and exit
if [ $1 == "--help" ] || [ $1 == "-h" ]
then
    help
fi

# Save operation 
OP=$1

if [ $OP == "a" ]
then
    if [ -z $3 ]
    then
        echo "Add requires an extension and one or more files."
        help
        exit 1
    fi

    # Save extension
    EXT=$2

    # Clear args, leave only files
    set -- "${@:3}"

    for i in $@
    do
        # Check if file already exists, prompt
        mv -i $i $i$EXT
    done
elif [ $OP == "r" ]
then
    if [ -z $3 ]
    then
        echo "Remove requires an extension and one or more files."
        help
        exit 1
    fi

    # Save extension
    EXT=$2

    # Clear args, leave only files
    set -- "${@:3}"

    for i in $@
    do
        # Check to avoid "$i and $i are the same file"
        mv -i $i $(basename $i $EXT)
    done
elif [ $OP == "t" ]
then
    if [ -z $2 ]
    then
        echo "Toggle requires one or more files."
        help
        exit 1
    fi

    # Clear args, leave only files
    set -- "${@:2}"

    for i in $@
    do
        # Check if file is a .bak or not
        if [ $i != $(basename $i .bak) ]
        then
            # Check if regular file already exists, prompt
            mv -i $i $(basename $i .bak)
        else
            # Check if .bak file already exists, prompt
            mv -i $i $i.bak
        fi
    done
else
    echo "Arg 1 must be a, r, or t, got $OP"
    help
fi
