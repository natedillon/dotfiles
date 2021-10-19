#!/bin/bash

#
# Post-install
#

# Clean up empty backup directories
if [ ! "$(ls -A $backup_location)" ]; then
  rmdir $backup_location
fi
if [ ! "$(ls -A $backup_root)" ]; then
  rmdir $backup_root
fi
