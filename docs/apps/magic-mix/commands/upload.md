---
title: "Upload"
description: "Documentation for the upload command in the Magic Mix CLI, used to upload a batch of data from a source folder to the database."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Upload
  - Batch Processing
  - Go
  - Cobra
---

# Upload Command - Magic Mix CLI

The `upload` command in the Magic Mix CLI is used to upload a batch of data from a specified source folder to a database table. This command simplifies the process of moving data from a local directory into the database.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Parameters](#parameters)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `upload` command facilitates the transfer of data from a local source folder into a specific database table, typically named `importdata`. This is particularly useful for batch processing scenarios where large volumes of data need to be ingested into a database.

## Usage

```bash
magic-mix upload [sourcefolder] [flags]
```

### Parameters

- **sourcefolder**: The path to the folder containing the data files to be uploaded. This is a required parameter.

### Operation

The command uploads the contents of the specified `sourcefolder` into the `importdata` table of the target database.

## Examples

Here are some examples of how to use the `upload` command:

- **Basic Upload Operation:**

  ```bash
  magic-mix upload users
  ```

  This command uploads the contents of the `users` folder to the `importdata` table in the target database.
