#!/bin/sh

FLUTTER_BUILD="flutter build apk"

if [ ! -z "$1" ]
then
    SUPPLIED_ENV_FILE="$1"
    while IFS= read -r line
    do
      FLUTTER_RUN="$FLUTTER_BUILD --dart-define $line"

    done < "$SUPPLIED_ENV_FILE"
fi
echo "Running: $FLUTTER_BUILD"
$FLUTTER_BUILD
