#!/bin/bash
df -h /dev/nvme0n1p6 | awk 'NR==2 {print $4}'  # This gets the available space for nvme0n1p6

