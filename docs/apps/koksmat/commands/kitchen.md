---
id: kitchen
title: Kitchen Command
sidebar_label: Kitchen
---

# `koksmat kitchen`

The `kitchen` command is used to manage and interact with kitchens in your project. A kitchen represents an environment or workspace where different services and components can be built, launched, and managed.

## Usage

```bash
koksmat kitchen [[service]] [flags]
koksmat kitchen [command]
```

This command allows you to perform various actions related to kitchens, such as booting, building, and managing different services.

## Available Subcommands

The `kitchen` command includes the following subcommands:

### `boot`

Boots the specified kitchens, preparing them for use.

### `build`

Builds the kitchen, setting up the necessary environment and components.

### `create`

Creates a new kitchen, initializing a fresh workspace for your project.

### `launch`

Launches the kitchen, making it active and ready for operations.

### `open`

Opens the kitchen, allowing you to access and work within it.

### `script`

Handles operations related to scripts within the kitchen, such as editing, running, and exporting them.

#### `edit`

Allows you to edit an existing script within the kitchen environment.

#### `execute`

Executes a script, running it within the kitchen environment.

#### `html`

Exports HTML content from the Markdown in the script, useful for generating web-friendly versions of your documentation or outputs.

#### `markdown`

Exports the Markdown content from the script, allowing you to retrieve the raw content for further editing or use.

#### `meta`

Exports metadata from the Markdown in the script, which can include information such as authorship, date, and other relevant details.

#### `run`

Runs the script in debug mode, allowing you to troubleshoot and fine-tune the script’s operations.

#### `setup`

Sets up the script environment, preparing it for execution or editing.

### `stations`

Lists all stations within the kitchen, providing an overview of available workspaces or services.

### `status`

Provides the current status of the kitchen, indicating whether it is active, in use, or idle.

## Flags

The `kitchen` command supports the following flags:

### `-h, --help`

This flag provides help for the `kitchen` command, displaying usage information and available subcommands.

## Additional Information

To get more detailed help on any subcommand, you can use the following syntax:

```bash
koksmat kitchen [command] --help
```

This will provide more in-depth information about each specific subcommand and its available options.

---

By using the `kitchen` command and its subcommands, you can efficiently manage your project's environments and scripts, ensuring that each kitchen is properly set up, maintained, and utilized.
