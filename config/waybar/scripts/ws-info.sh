#!/bin/bash

workspaces=$(swaymsg -t get_workspaces)

focused=$(echo "$workspaces" | jq -r '.[] | select(.focused).name')
total=$(echo "$workspaces" | jq '[.[] | .num] | max')

echo "$focused/$total"
