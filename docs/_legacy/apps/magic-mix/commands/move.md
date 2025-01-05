---
title: "Move"
description: "Documentation for the move command in the Magic Mix CLI, used to move batches of records from one database table to another."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Movement
  - Database
  - Batches
  - Go
  - Cobra
---

# Move Command - Magic Mix CLI

The `move` command in the Magic Mix CLI is used to move batches of records from one database table to another. This command is particularly useful for transferring data in a controlled manner, ensuring that only new batches of data are moved to the destination table.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Parameters](#parameters)
  - [Required Parameters](#required-parameters)
  - [Optional Parameters](#optional-parameters)
- [Batch Handling](#batch-handling)
  - [Batch Identification](#batch-identification)
  - [Batch Movement Criteria](#batch-movement-criteria)
  - [Batch Size](#batch-size)
  - [Destination Table Requirement](#destination-table-requirement)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `move` command facilitates the transfer of data between database tables in batches. The command ensures that only distinct batches (as identified by a `batchname` column) that are not already present in the destination table are moved. This operation helps in maintaining data consistency and avoiding duplication.

## Usage

```bash
magic-mix move [from] [to] [source] [destination] [storedprocedure] [flags]
```

## Parameters

### Required Parameters

- **from**: The source database connection string. This parameter is required to establish a connection to the source database.
- **to**: The destination database connection string. This parameter is required to establish a connection to the destination database.
- **source**: The name of the source table from which data will be moved.
- **destination**: The name of the destination table where the data will be moved.

### Optional Parameters

- **storedprocedure**: The stored procedure to execute at the destination after moving the batch. This is optional but required if the destination table is not named `importdata`.

## Batch Handling

### Batch Identification

Both the source and destination tables must contain a column named `batchname`. This column is used to identify and differentiate batches of records during the move operation.

### Batch Movement Criteria

The destination table is queried for distinct `batchname` values. The source table is also queried for distinct `batchname` values. If a `batchname` exists in the source table but not in the destination table, that batch of records is moved.

### Batch Size

Data is always moved in batches, with a maximum batch size of 10,000 records. This ensures efficient data transfer while managing large datasets.

### Destination Table Requirement

Data is always initially moved to a destination table named `importdata`. If the destination table specified in the command is not named `importdata`, the operation will fail unless a stored procedure is provided. The purpose of the stored procedure is to move the data from the `importdata` table to the final destination table.

## Examples

Here are some examples of how to use the `move` command:

- **Basic Move Operation:**

  ```bash
  magic-mix move mix files sharepoint.pageviews events
  ```

  This command moves batches of data from the `sharepoint.pageviews` table in the `mix` database to the `events` table in the `files` database.

- **Move with Stored Procedure:**

  ```bash
  magic-mix move mix files sharepoint.pageviews events insert_audit_records
  ```

  This command moves data from the `sharepoint.pageviews` table to the `events` table and then executes the `insert_audit_records` stored procedure to process the data.

## Flags

- `-h, --help`: Displays help information for the `move` command.

## Global Flags

The following global flags can be used with any command in the Magic Mix CLI:

- `-o, --output string`: Specifies the output format (e.g., json, yaml, xml).
- `-v, --verbose`: Enables verbose output, providing more detailed information during execution.

## Error Handling

### Common Errors

- **Missing Required Parameters:**

  If you do not provide all the required parameters (`from`, `to`, `source`, `destination`), the command will fail, and you will see an error message indicating which parameters are missing.

- **Destination Table Not Named `importdata` Without Stored Procedure:**

  If the destination table is not named `importdata` and no stored procedure is provided, the command will fail. Ensure that either the destination table is named `importdata` or that you provide a stored procedure to handle the data transfer.
