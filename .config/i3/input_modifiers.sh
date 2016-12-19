#!/bin/sh

TOUCH=$(xinput | grep "TouchPad" | awk '{print $6}' | tr -dc '0-9')
TOUCH_ENTITY=$(xinput list-props $TOUCH | grep "Scrolling Distance" | awk '{print $ 4}' | tr -dc '0-9')
xinput set-prop $TOUCH $TOUCH_ENTITY -99 -99

MOUSE=$(xinput | grep "Mouse" | awk '{print $6}' | tr -dc '0-9')
MOUSE_ENTITY=$(xinput list-props $MOUSE | grep "Scrolling Distance" | awk '{print $ 4}' | tr -dc '0-9')
xinput set-prop $MOUSE $MOUSE_ENTITY 1 1 1
