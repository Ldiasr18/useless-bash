#!/usr/bin/env bash

ping -c 2 -w 4 127.0.0.1 && printf "\nYes, the TCP/IP stack works, congrats\n" || printf "\nNo.. HOW??\n"
