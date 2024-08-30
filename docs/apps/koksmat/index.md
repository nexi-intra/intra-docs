---
id: index
title: Koksmat CLI
sidebar_label: Koksmat CLI
---

# Koksmat CLI Overview

Welcome to the documentation for the `koksmat` CLI! This tool helps you manage your projects with a variety of commands that streamline your workflow.

## Installation

Make sure you have Go installed on your system before proceeding .

To install the Koksmat CLI, run this command.

```bash
go install github.com/koksmat-com/koksmat@v2.1.13.27;
```

You can find a list of the latest releases here https://github.com/koksmat-com/koksmat/releases

## Available Commands

Here is a list of all the available commands in `koksmat`:

| Command                        | Description                     |
| ------------------------------ | ------------------------------- |
| [add](commands/add.md)         | Add ingredients to your project |
| [auto](commands/auto/index.md) | Auto pilot mode                 |
| [context](commands/context.md) | Manage context configurations   |
| [kitchen](commands/kitchen.md) | Manage kitchen settings         |

There is a few more commands, but they are not documented as they are legacy.

## Usage

To use any of the commands, the basic syntax is:

```bash
koksmat [command]
```
