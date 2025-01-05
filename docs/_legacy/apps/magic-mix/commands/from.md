---
title: "From"
description: "Comprehensive documentation for the from command in the Magic Mix CLI, including its subcommands for transforming data from Excel files into JSON or SQL formats."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Transformation
  - Excel
  - JSON
  - SQL
  - Go
  - Cobra
---

# From Command - Magic Mix CLI

The `from` command in the Magic Mix CLI is designed to transform data from various formats, primarily focusing on Excel files. This command serves as the parent for specific subcommands that handle the transformation of Excel data into different target formats like JSON and SQL.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Subcommands](#subcommands)
  - [excel](#excel)
    - [to](#to)
      - [json](#json)
      - [sql](#sql)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `from` command in the Magic Mix CLI allows users to specify a source format from which data will be transformed. Currently, the command supports transformations from Excel files into other formats such as JSON and SQL.

## Usage

```bash
magic-mix from [command] [flags]
```

The `from` command requires a subcommand to define the source and target format for the data transformation.

## Subcommands

### excel

The `excel` subcommand specifies that the source format is an Excel file (.xlsx). This subcommand is used in combination with the `to` subcommand to define the target format for the transformation.

**Usage:**

```bash
magic-mix from excel [command] [flags]
```

#### to

The `to` subcommand under `excel` specifies the target format to which the Excel data will be transformed. This subcommand further includes specific commands like `json` and `sql` to define the exact transformation.

**Usage:**

```bash
magic-mix from excel to [command] [flags]
```

##### json

The `json` subcommand is used to convert an Excel file into a JSON file.

**Usage:**

```bash
magic-mix from excel to json [excelfilename] [outputfile] [flags]
```

**Arguments:**

- **excelfilename**: The Excel file (.xlsx) to transform (required).
- **outputfile**: The output JSON file where the transformed data will be saved (required).

**Examples:**

- **Convert an Excel file to JSON:**

  ```bash
  magic-mix from excel to json data.xlsx data.json
  ```

  This command transforms the data in `data.xlsx` and saves it as `data.json`.

**Flags:**

- `-h, --help`: Displays help information for the `json` subcommand.

##### sql

The `sql` subcommand is used to convert data from an Excel sheet into SQL insert statements.

**Usage:**

```bash
magic-mix from excel to sql [excelfilename] [sheetname] [namespace] [tablename] [flags]
```

**Arguments:**

- **excelfilename**: The Excel file (.xlsx) to transform (required).
- **sheetname**: The name of the sheet within the Excel file to transform (required).
- **namespace**: The namespace or schema under which the SQL table exists (required).
- **tablename** (optional): The name of the table into which the data should be inserted. If not provided, the name will be inferred from the Excel sheet.

**Examples:**

- **Convert an Excel sheet to SQL statements:**

  ```bash
  magic-mix from excel to sql data.xlsx Sheet1 mynamespace mytable
  ```

  This command generates SQL insert statements for the data in `Sheet1` of `data.xlsx` under the `mynamespace` schema, targeting the `mytable` table.

- **Convert an Excel sheet to SQL without specifying a table name:**

  ```bash
  magic-mix from excel to sql data.xlsx Sheet1 mynamespace
  ```

  This command generates SQL insert statements for the data in `Sheet1` of `data.xlsx` under the `mynamespace` schema, with the table name inferred from the sheet name.

**Flags:**

- `-h, --help`: Displays help information for the `sql` subcommand.

## Examples

Here are some examples of how to use the `from` command and its subcommands:

- **Convert Excel to JSON:**

  ```bash
  magic-mix from excel to json input.xlsx output.json
  ```

- **Convert Excel to SQL:**

  ```bash
  magic-mix from excel to sql data.xlsx Sheet1 mynamespace mytable
  ```

## Flags

Each subcommand within the `from` command has its own specific flags, but the following flag is common across all subcommands:

- `-h, --help`: Displays help information for the specific subcommand.

## Global Flags

The following global flags can be used with any command in the Magic Mix CLI:

- `-o, --output string`: Specifies the output format (e.g., json, yaml, xml).
- `-v, --verbose`: Enables verbose output, providing more detailed information during execution.

## Error Handling

### Common Errors

If the required arguments for the `from` command's subcommands are not provided, you will see an error like:

```plaintext
Error: requires at least 2 arg(s), only received 0
```

Make sure to provide all necessary arguments, such as `excelfilename`, `sheetname`, and `namespace` when using the `excel to sql` subcommand.

### Specific Error for `sql` Subcommand

If the `sql` subcommand is executed without the required arguments, you will encounter an error message:

```plaintext
Error: accepts 3 arg(s), received 0
```

Ensure that you provide at least the `excelfilename`, `sheetname`, and `namespace` arguments when using this subcommand.
