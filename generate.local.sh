#!/usr/bin/env bash


BOLD="\033[1m"
RESET="\033[0m"

cd "$(dirname $0)"

local_script_name=".update.local.sh"
repo_dir="$(pwd)"


envsubst < update.local.template > "$local_script_name"
chmod +x "$local_script_name"

printf "Generated $local_script_name.\n"
printf "Add the following line to the user's crontab:\n\n"
printf "${BOLD}0 * * * * PATH=/usr/local/bin:/usr/bin $repo_dir/$local_script_name${RESET}\n\n"
