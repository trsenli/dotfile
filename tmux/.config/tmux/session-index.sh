#!/usr/bin/env bash
# Script to calculate session index in format [current/total]
# Usage: ./session-index.sh

current_session=$(tmux display-message -p '#S')
all_sessions=$(tmux list-sessions -F '#{session_name}')

# Get current session index (1-based)
index=$(echo "$all_sessions" | grep -n "^${current_session}$" | cut -d: -f1)

# Get total session count
total=$(echo "$all_sessions" | wc -l | tr -d ' ')

echo "[${index}/${total}]"
