---
title: "Copy"
description: "Documentation for the copy command in the Magic Mix CLI, used to move data between database tables."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Operations
  - Copy
  - Database
  - Go
  - Cobra
---

# Copy Command - Magic Mix CLI

The `copy` command in the Magic Mix CLI is used to transfer batches of records from one database table to another. It is particularly useful for moving data efficiently between different database environments.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Parameters](#parameters)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `copy` command facilitates the movement of data between database tables, handling data in batches of up to 10,000 records at a time. The destination table is expected to be named `importdata`, but if a different table is specified, a stored procedure must be provided to move the data accordingly.

## Usage

```bash
magic-mix copy [from] [to] [source] [destination] [storedprocedure] [flags]
```

### Required Parameters

- **from**: The source database connection string.
- **to**: The destination database connection string.
- **source**: The name of the source table (or view) from which data is being copied.
- **destination** (optional): The name of the destination table. If not provided or if the destination table is not named `importdata`, a stored procedure must be provided.
- **storedprocedure** (optional): A stored procedure to handle moving data from the `importdata` table to the final destination table.

### Important Notes

- **Page Size**: Data is moved in batches with a maximum of 10,000 records per batch.
- **Destination Table Requirement**: The data will be copied to a table named `importdata`. If the destination table has a different name, the operation will fail unless a stored procedure is provided to handle the data transfer from `importdata` to the final destination.

## Examples

Here are some examples of how to use the `copy` command:

- **Basic Copy Operation:**

  ```bash
  magic-mix copy "dbsource" "dbdest" "source_table"
  ```

  This command copies data from `source_table` in the `dbsource` database to the `importdata` table in the `dbdest` database.

- **Copy with Destination Table and Stored Procedure:**

  ```bash
  magic-mix copy "dbsource" "dbdest" "source_table" "final_table" "move_data_procedure"
  ```

  This command copies data from `source_table` in the `dbsource` database to the `final_table` in the `dbdest` database using the `move_data_procedure` stored procedure.

## Flags

- `-h, --help`: Displays help information for the `copy` command.

## Global Flags

The following global flags can be used with any command in the Magic Mix CLI:

- `-o, --output string`: Specifies the output format (e.g., json, yaml, xml).
- `-v, --verbose`: Enables verbose output, providing more detailed information during execution.

## Error Handling

If the required parameters for the `copy` command are not provided, or if the destination table is not correctly handled, you may encounter errors:

- **Missing Parameters:**

  ```plaintext
  Error: requires at least 3 arg(s), only received 0
  ```

  Ensure that you provide the `from`, `to`, and `source` parameters at a minimum.

- **Incorrect Destination Table Handling:**

  If the destination table is not named `importdata` and no stored procedure is provided, the task will fail. Make sure to either use `importdata` as the destination table name or provide a stored procedure.
