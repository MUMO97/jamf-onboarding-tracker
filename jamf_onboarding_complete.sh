#!/bin/bash
#
# jamf_onboarding_complete.sh
# Writes a marker file to confirm Jamf onboarding has completed.
# Deploy as the final script in your Jamf onboarding policy.
#
# Author:  MUMO97
# Version: 1.0
#

MARKER_FILE="/Users/Shared/jamfonboarding_dummy_file.txt"

# Write marker file with timestamp
echo "Jamf Onboarding Complete" > "$MARKER_FILE"
echo "Completed: $(date)" >> "$MARKER_FILE"
chmod 644 "$MARKER_FILE"

# Verify
if [[ -f "$MARKER_FILE" ]]; then
    echo "Marker file created: $MARKER_FILE"
    exit 0
else
    echo "ERROR: Failed to create marker file at $MARKER_FILE"
    exit 1
fi
