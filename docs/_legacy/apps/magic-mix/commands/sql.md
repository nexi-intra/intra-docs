---
title: "SQL"
description: "Documentation for the sql command in the Magic Mix CLI, used to execute and query SQL statements on specified databases."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - SQL
  - Database Management
  - Query Execution
  - Go
  - Cobra
---

# SQL Command - Magic Mix CLI

The `sql` command in the Magic Mix CLI is used to execute and query SQL statements on specified databases. It provides powerful tools for interacting with databases directly from the command line, enabling both data retrieval and manipulation.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Subcommands](#subcommands)
  - [query](#query)
  - [exec](#exec)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `sql` command allows users to run SQL statements against databases. It includes two main subcommands: `query` for selecting data and `exec` for executing SQL statements that modify data. This command is ideal for database administrators and developers who need to interact with databases directly from the command line.

## Usage

```bash
magic-mix sql [command] [flags]
```

The `sql` command requires a subcommand to specify whether you're executing a query or an SQL command that modifies data.

## Subcommands

### query

The `query` subcommand is used to run SQL SELECT statements on a specified database. This is useful for retrieving data and performing read-only operations.

**Usage:**

```bash
magic-mix sql query [database] [sqlstatement] [flags]
```

**Arguments:**

- **database**: The database connection string or alias where the query will be executed.
- **sqlstatement**: The SQL SELECT statement to execute.

**Examples:**

- **Run a Simple Query:**

  ```bash
  magic-mix sql query files "SELECT 1 as col1"
  ```

  This command runs a simple SQL query on the `files` database and returns the result.

**Flags:**

- `-h, --help`: Displays help information for the `query` subcommand.

### exec

The `exec` subcommand is used to execute SQL statements that modify data in a specified database. This includes operations such as INSERT, UPDATE, DELETE, and other non-SELECT SQL commands.

**Usage:**

```bash
magic-mix sql exec [database] [sqlstatement] [flags]
```

**Arguments:**

- **database**: The database connection string or alias where the SQL statement will be executed.
- **sqlstatement**: The SQL statement to execute (e.g., DELETE, UPDATE).

**Examples:**

- **Execute a DELETE Statement:**

  ```bash
  magic-mix sql exec files "DELETE FROM table WHERE id = 1"
  ```

  This command executes a DELETE statement on the `files` database, removing the record where `id = 1`.

**Flags:**

- `-h, --help`: Displays help information for the `exec` subcommand.

## Examples

Here are some examples of how to use the `sql` command:

- **Run a SELECT Query:**

  ```bash
  magic-mix sql query files "SELECT name, age FROM users WHERE active = 1"
  ```

  This command retrieves the names and ages of all active users from the `users` table in the `files` database.

- **Execute an UPDATE Statement:**

  ```bash
  magic-mix sql exec files "UPDATE users SET active = 0 WHERE last_login < '2023-01-01'"
  ```

  This command deactivates users in the `users` table who haven't logged in since January 1, 2023.
