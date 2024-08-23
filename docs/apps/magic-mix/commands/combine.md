---
title: "Combine"
description: "Documentation for the combine command in the Magic Mix CLI, used to merge multiple JSON files into one."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Operations
  - Combine
  - JSON
  - Go
  - Cobra
---

# Combine Command - Magic Mix CLI

The `combine` command in the Magic Mix CLI is used to merge multiple JSON files from a specified folder into a single JSON file. This command is particularly useful for consolidating data that is spread across multiple files.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `combine` command allows you to specify a folder containing JSON files and combine all files that match a specified prefix into one single JSON file. Optionally, you can delete the original files after they have been combined.

## Usage

```bash
magic-mix combine sourcefolder prefix [delete] [flags]
```

**Arguments:**

1. **sourcefolder**: The folder containing the JSON files you want to combine (required).
2. **prefix**: The prefix of the files you want to combine (required). Only files matching `prefix*.json` will be combined.
3. **delete** (optional): If the word "delete" is provided as the third argument, the original files will be deleted after combining.

## Examples

Here are some examples of how to use the `combine` command:

- **Combine JSON files in a folder:**

  ```bash
  magic-mix combine groups owners
  ```

  This command combines all files in the `groups` folder that match the prefix `owners` (e.g., `owners1.json`, `owners2.json`) into a single file named `owners.json`.

- **Combine and delete original files:**

  ```bash
  magic-mix combine groups owners delete
  ```

  This command combines all files in the `groups` folder that match the prefix `owners` and then deletes the original files after combining them into `owners.json`.
