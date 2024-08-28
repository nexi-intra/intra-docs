---
title: Download
description: "Detailed documentation for the download command in the Magic Mix CLI, covering its subcommands including auditlog and batch for downloading data."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Operations
  - Downloads
  - JSON
  - YAML
  - Go
  - Cobra
---

# Download Command

The `download` command in the Magic Mix CLI is used to handle various data downloading tasks. It provides subcommands for specific operations, such as downloading audit logs or initiating batch downloads using a configuration file. This page covers the `download` command and its subcommands in detail.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Subcommands](#subcommands)
  - [auditlog](#auditlog)
  - [batch](#batch)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `download` command is a versatile part of the Magic Mix CLI, designed to facilitate the downloading of various types of data. Depending on the subcommand used, it can retrieve audit logs or manage batch downloads from multiple URLs.

## Usage

```bash
magic-mix download [subcommand] [flags]
```

This command acts as a parent command for its subcommands, each of which handles a specific type of download operation.

## Subcommands

### auditlog

The `auditlog` subcommand is used to download audit logs for a specified date range. It allows users to download logs for an entire year, a specific month, or a particular day.

**Usage:**

```bash
magic-mix download auditlog [destination folder] [[year]] [[month]] [[day]] [flags]
```

**Arguments:**

- **Destination folder**: The folder where the audit logs will be saved (required).
- **Year** (optional): The year for which the logs should be downloaded.
- **Month** (optional): The month for which the logs should be downloaded.
- **Day** (optional): The day for which the logs should be downloaded.

**Examples:**

- Download all available audit logs:

  ```bash
  magic-mix download auditlog auditlogs
  ```

- Download audit logs for December 1, 2024:

  ```bash
  magic-mix download auditlog auditlogs 2024 12 1
  ```

**Flags:**

- `-h, --help`: Displays help information for the `auditlog` subcommand.

### batch

The `batch` subcommand initiates a batch download process using a configuration file. This file can be in either JSON or YAML format and defines the URLs and related sub-requests to be downloaded.

**Usage:**

```bash
magic-mix download batch [destination folder] [batchfile.json|batchfile.yaml] [flags]
```

**Arguments:**

- **Destination folder**: The folder where the downloaded data will be saved (required).
- **Batchfile**: The JSON or YAML configuration file that defines the download process (required).

**Configuration File Formats:**

- **JSON Format:**

  ```json
  {
    "url": "https://graph.microsoft.com/v1.0/groups",
    "childUrls": [
      {
        "url": "https://graph.microsoft.com/v1.0/groups/{{.id}}/owners",
        "prefix": "owners"
      },
      {
        "url": "https://graph.microsoft.com/v1.0/groups/{{.id}}/members",
        "prefix": "members"
      }
    ]
  }
  ```

- **YAML Format:**

  ```yaml
  url: https://graph.microsoft.com/v1.0/groups
  childUrls:
    - url: https://graph.microsoft.com/v1.0/groups/{{.id}}/owners
      prefix: owners
    - url: https://graph.microsoft.com/v1.0/groups/{{.id}}/members
      prefix: members
  ```

**Examples:**

- Start a batch download using a JSON configuration file:

  ```bash
  magic-mix download batch groups groupdata.json
  ```

- Start a batch download using a YAML configuration file:

  ```bash
  magic-mix download batch groups groupdata.yaml
  ```

**Flags:**

- `-h, --help`: Displays help information for the `batch` subcommand.
- `--dryrun`: Simulate the batch download without actually downloading files

## Flags

Each subcommand within the `download` command has its own specific flags, but the following flags are common across all subcommands:

- `-h, --help`: Displays help information for the specific subcommand.

## Global Flags

The following global flags can be used with any command in the Magic Mix CLI:

- `-o, --output string`: Specifies the output format (e.g., json, yaml, xml).
- `-v, --verbose`: Enables verbose output, providing more detailed information during execution.
