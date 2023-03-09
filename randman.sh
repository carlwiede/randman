#!/usr/bin/bash

######################################
#                                    #
# randman - random man page explorer #
#                                    #
######################################

# Man source directory
MAN_SRC=/usr/share/man

# Grep names of each man section
MAN_DIRS=$(ls $MAN_SRC | grep man*)

# Get complete paths of man sections
for DIR in $MAN_DIRS; do
    MAN_PATHS+="$MAN_SRC/$DIR "
done

# Collect names of all man pages (with .gz extension)
for MAN_PATH in $MAN_PATHS; do
    for PAGE in $(ls $MAN_PATH); do
        PAGES+=("$PAGE")
    done
done

# Display the man page
man "${PAGES[$(( $RANDOM % ${#PAGES[@]} ))]::-3}"