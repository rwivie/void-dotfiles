#!/bin/sh
sleep 5
conky -q -c /home/ron/.config/conky/conky_maia &
conky -q -c /home/ron/config/conky/conkyrc-mpd &
conky -q -c /home/ron/.config/conky/conky1.10_shortcuts_maia & exit
