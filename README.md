# Jamf Onboarding Completion Tracker

A lightweight shell script that creates a marker file on macOS to confirm a Jamf Pro onboarding workflow has completed. Designed to be deployed as the final step in an onboarding policy and paired with an Extension Attribute for smart group scoping.

---

## How it works

The script writes a timestamped file to `/Users/Shared/` on the managed device. An Extension Attribute then checks for the presence of that file and returns `Complete` or `Incomplete` — giving you a reliable, queryable onboarding state in Jamf Pro.

---

## Deployment

### 1. Add the script to Jamf Pro

- **Jamf Pro** → **Settings** → **Computer Management** → **Scripts**
- Add `jamf_onboarding_complete.sh`
- Set execution frequency: **Once per computer**

### 2. Add it to your onboarding policy

- Scope the policy to your onboarding smart group
- Add the script as the **last payload** in the policy
- Trigger: **Enrollment Complete** or custom event

### 3. Create the Extension Attribute

- **Jamf Pro** → **Settings** → **Computer Management** → **Extension Attributes**
- Data type: **String**
- Input type: **Script**

```bash
#!/bin/bash

if [ -f "/Users/Shared/jamfonboarding_dummy_file.txt" ]; then
    echo "<result>Complete</result>"
else
    echo "<result>Incomplete</result>"
fi
```

### 4. Build a Smart Group

Create a smart group with the criteria:

```
Onboarding Status | is | Complete
```

Use this group to scope post-onboarding policies or to exclude devices still in progress.

---

## File location

```
/Users/Shared/jamfonboarding_dummy_file.txt
```

This path is writable by all users and persists across user sessions, making it reliable for shared and single-user workflows.

---

## Requirements

- macOS 11.0 or later
- Jamf Pro with script deployment capability
- Policy run as: **root**

---

## Related

- [Nexus — Jamf EA Dependency Analyzer](https://github.com/MUMO97/nexus) — visualize which smart groups and searches depend on Extension Attributes like this one
