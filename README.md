## macOS - Dummy File for Jamf Onboarding Completion

This repository contains a simple shell script that creates a **dummy file** on macOS to mark the **completion of a Jamf Pro onboarding workflow**. It is intended to be run as the **final step** in your onboarding policy and can be used in combination with an **extension attribute** to determine if onboarding has successfully completed.

### ✅ Purpose

- Acts as a completion marker for onboarding.
- Useful for Jamf smart group scoping or compliance checks.
- Enables Jamf admins to reliably track onboarding status.

### 📂 File Created

```plaintext
/Users/Shared/jamfonboarding_dummy_file.txt
```

This file includes a timestamp and a message confirming onboarding completion.

### 🧩 Sample Extension Attribute (Jamf Pro)


#!/bin/bash

if [ -f "/Users/Shared/jamfonboarding_dummy_file.txt" ]; then
    echo "<result>Complete</result>"
else
    echo "<result>Incomplete</result>"
fi


### 📋 Usage

1. Add this script as the **last step** in your Jamf onboarding policy.
2. Use the provided extension attribute in Jamf Pro to check file presence.
3. Build smart groups or scoped policies based on the result.
