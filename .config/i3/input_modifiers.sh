#!/bin/sh

TOUCH=$(xinput | grep "TouchPad" --ignore-case | head -n 1 | awk '{print $6}' | tr -dc '0-9')
TOUCH_ENTITY=$(xinput list-props $TOUCH | grep "Scrolling Distance" | awk '{print $ 4}' | tr -dc '0-9')
xinput set-prop $TOUCH $TOUCH_ENTITY -99 -99

MOUSE=$(xinput | grep "Mouse" | awk '{print $6}' | tr -dc '0-9')
MOUSE_ENTITY=$(xinput list-props $MOUSE | grep "Scrolling Distance" | awk '{print $ 4}' | tr -dc '0-9')
xinput set-prop $MOUSE $MOUSE_ENTITY 1 1 1

TS=$(xinput --list | grep ouchscreen | cut -f 2 | grep -Eo '[0-9]{1,4}')
xinput disable $TS
