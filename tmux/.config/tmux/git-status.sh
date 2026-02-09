#!/bin/bash
cd "$1" 2>/dev/null || exit
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
    DIRTY=$(git status -s 2>/dev/null | wc -l | tr -d ' ')
    if [ "$DIRTY" -gt 0 ]; then
        echo "$BRANCH|$DIRTY"
    else
        echo "$BRANCH"
    fi
else
    echo "no-git"
fi
