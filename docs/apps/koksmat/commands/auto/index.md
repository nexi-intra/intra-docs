---
id: auto
title: Auto Command
sidebar_label: Auto
---

# `koksmat auto`

The `auto` command is used to automate various tasks within your project. It supports multiple subcommands, each designed to perform specific automated actions.

## Usage

```bash
koksmat auto [command] [flags]
```

This command allows you to execute different subcommands under the `auto` umbrella.

## Available Subcommands

The `auto` command includes the following subcommands:

### `add`

Automates the addition of certain elements or configurations to your project.

### `list`

Lists all available automated tasks or configurations in the current context.

### `pwsh`

Runs PowerShell scripts or commands as part of your automation process.

### `remove`

Automates the removal of elements or configurations from your project.

### `run`

Executes a predefined automation script or command sequence.

[More details](./run.md)

### `set`

Configures or sets specific parameters or options within your automation tasks.

## Flags

The `auto` command supports the following flags:

### `-h, --help`

This flag provides help for the `auto` command, displaying usage information and available subcommands.

## Additional Information

To get more detailed help on any subcommand, you can use the following syntax:

```bash
koksmat auto [command] --help
```

This will provide more in-depth information about each specific subcommand and its available options.

---

By using the `auto` command, you can streamline repetitive tasks and manage your project more efficiently by automating various processes.
