#!/bin/bash

# In Terminal:

# sudo pmset -c gpuswitch 1 && pmset -b gpuswitch 0

# Basically the command aboves sets your power management to while charging (-c) use discrete graphics (gpuswitch 1), and while on battery (-b) use integrated (gpuswitch 0).

# To reset, just type

# sudo pmset -a gpuswitch 2

# Which will set all power profiles to auto switching for graphics card.

# Use

# pmset -g

# To check your power management profile settings.

pmset -c gpuswitch 1 && pmset -b gpuswitch 0
pmset -g

