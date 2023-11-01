---
tags: [Role-HR, Role-Comms]
status: draft
---

# Group Manager

The Group Manager application is an application which allows HR to upload an Excel file with a list of email addressses and additional metadata.

- Display name
- Email address
- Country
- Workplace Address
- Level 2 Unit
- Level 3 Unit
- Level 4 Unit
- Level 5 Unit
- Level 6 Unit
- Level 7 Unit
- Level 8 Unit
- Level 9 Unit
- Report to
- Department ID

## Roles

### HR

**Uploads and Validate Excel file**

The End User is presented for a UI showcasing how the system interprets the Excel file. The End User can then validate the content and either accept or reject the content.

### Comms

Get notified about the status of the process

## System Roles

### Create Missing Groups
Run sequentially through the list of groups and creates any missing groups.

### Create Contact Objects
Run sequentially through the list of contacts and creates any missing contacts.

### Get Unique ID for Emails
Run trough all email addresses and gets the unique ID for each.

### Generate update scripts
This generates the update scripts for the groups and contacts.

### Execute update scripts
Updates scripts run in parallel with a max number of threads matching the number of allowed Exchange Management sessions in your tenant

### Delete Missing Groups
Run sequentially through the list of groups and deletes those know longer needed.

### Publish Group Finder index
Publishes the Group Finder index to the Group Finder API