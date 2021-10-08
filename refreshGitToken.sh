#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`

GIT_CONFIG_PATH='/.git/config'

TOKEN=$1
PROJECT_PATH=$2
if  [ ${3} = '-n' ]; then
    SKIP_CONFIRM=true
else
    SKIP_CONFIRM=false
fi

ask() {
    if  [ "$SKIP_CONFIRM" = true ]; then
        	return
    fi
    local prompt default reply

    if  [ -z "$2" ]; then
    	prompt='y/n'
        default=''
    elif [ ${2} = 'Y' ]; then
        prompt='Y/n'
        default='Y'
    elif [ ${2} = 'N' ]; then
        prompt='y/N'
        default='N'
    fi

    while true; do
        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "
        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read -r reply </dev/tty
        # Default?
        if [ -z $reply ]; then
            reply=$default
        fi
        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

echo "${blue}Welcome to RefreshGitToken script\n${reset}"

if [ -z "$1" ] || [ -z "$2" ]  
then
	echo "\n${yellow}Please specify the new token as first argument and ABSOLUTE path of the project as second argument
	\n${reset}Ex : sh refreshGitToken.sh mynewtoken /home/me/myprojectdir"
	exit 0
fi

ABSOLUTE_GIT_FILE=$PROJECT_PATH$GIT_CONFIG_PATH

if [ -f "$ABSOLUTE_GIT_FILE" ]
then
    echo "file ${yellow}$ABSOLUTE_GIT_FILE${reset} will be patched."
    if ask "Are you sure ?" N; then
        if [ "$SKIP_CONFIRM" = true ]; then echo "This line have be modified :"; else echo "This line will be modified :"; fi
    	oldLine=$(cat $ABSOLUTE_GIT_FILE | sed -n "s/\(url\)/\1/p")
        echo "${red}[-]$oldLine\n${reset}"
        newLine=$(cat $ABSOLUTE_GIT_FILE | sed -E -n "s/(url = https?:\/\/.*:)(.*)(@github.com\/.*)/\1$TOKEN\3/p")
    	echo "${green}[+]$newLine${reset}"

        if ask "Proceed ?" N; then
            sed -i -E "s/(url = https?:\/\/.*:)(.*)(@github.com\/.*)/\1$TOKEN\3/" $ABSOLUTE_GIT_FILE
            echo "${green}[OK]${reset} The file have been successfully modified"
        else
            echo "${yellow}No modifications were made${reset}"
        fi    	
	else
    	echo "${yellow}No modifications were made${reset}"
	fi
else 
    echo "git config file ${red}$ABSOLUTE_GIT_FILE{reset} does not exist.${reset}"
fi

exit 0