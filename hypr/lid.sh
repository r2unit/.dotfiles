#!/bin/bash

if grep -q open /proc/acpi/button/lid/*/state; then
    hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1"
    hyprctl keyword monitor "desc:Samsung Electric Company LC32G5xT H4ZNB00268,2560x1440@60,1920x0,1"
    hyprctl keyword monitor "desc:Samsung Electric Company LC32G5xT H4ZNB00269,1920x1080@60,4480x0,1"
else
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "desc:Samsung Electric Company LC32G5xT H4ZNB00268,2560x1440@60,0x0,1"
    hyprctl keyword monitor "desc:Samsung Electric Company LC32G5xT H4ZNB00269,1920x1080@60,2560x0,1"
fi
