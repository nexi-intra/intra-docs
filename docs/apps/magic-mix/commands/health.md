---
title: "Health"
description: "Documentation for the health command in the Magic Mix CLI, used to check the status or version of the core system through various subcommands like ping and coreversion."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Health Check
  - Versioning
  - Ping
  - Go
  - Cobra
---

# Health Command - Magic Mix CLI

The `health` command in the Magic Mix CLI is used to perform basic health checks and version checks on the system. It includes subcommands like `ping` to check responsiveness and `coreversion` to display the version of the core system.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Subcommands](#subcommands)
  - [ping](#ping)
  - [coreversion](#coreversion)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `health` command allows users to check the health or status of the system by performing simple operations like a ping or checking the version of the core system. This command is useful for ensuring that the system is up and running and is using the correct version.

## Usage

```bash
magic-mix health [command] [flags]
```

The `health` command requires a subcommand to specify the type of health check or version check to perform.

## Subcommands

### ping

The `ping` subcommand under the `health` command is used to check the responsiveness of the system. When executed, it sends a simple `ping` and expects a `pong` response, confirming that the system is active and responsive.

**Usage:**

```bash
magic-mix health ping pong [flags]
```

**Arguments:**

- **pong**: This is a required argument to trigger the `pong` response.

**Example:**

- **Basic Ping Operation:**

  ```bash
  magic-mix health ping pong
  ```

  This command sends a `ping` and expects the system to return `pong`, confirming that the system is responsive.

  The command also logs the operation, including the start and end of the transcript, which is saved to a file.

**Flags:**

- `-h, --help`: Displays help information for the `ping` subcommand.

### coreversion

The `coreversion` subcommand under the `health` command is used to check the version of the core system. This is particularly useful for ensuring that the correct version of the system is running.

**Usage:**

```bash
magic-mix health coreversion [flags]
```

**Output:**

- The command returns the version number of the core system.

**Example:**

- **Check Core System Version:**

  ```bash
  magic-mix health coreversion
  ```

  Output:

  ```plaintext
  2024/08/23 09:51:51 Transcript started, output file is /Users/youruser/magic-mix/.koksmat/sessions/20240823T0951507981850200/transcript.txt
  2024/08/23 09:51:51 ##START##
  2024/08/23 09:51:51 v1.0.0.0
  2024/08/23 09:51:51 Transcript stopped, output file is /Users/youruser/magic-mix/.koksmat/sessions/20240823T0951507981850200/transcript.txt
  done
  ```

  This output indicates that the core system is running version `v1.0.0.0`.

**Flags:**

- `-h, --help`: Displays help information for the `coreversion` subcommand.

## Examples

Here are some examples of how to use the `health` command with its subcommands:

- **Perform a Ping Check:**

  ```bash
  magic-mix health ping pong
  ```

- **Check Core System Version:**

  ```bash
  magic-mix health coreversion
  ```
