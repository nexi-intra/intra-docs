---
title: "Parse"
description: "Documentation for the parse command in the Magic Mix CLI, used to parse data files and process meeting data."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Parsing
  - JSON
  - Go
  - Cobra
---

# Parse Command - Magic Mix CLI

The `parse` command in the Magic Mix CLI is used to parse data files that have been previously downloaded or generated. The `file` subcommand specifically calls the `ParseMeetings` Go function to process meeting data from a given input file.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Subcommands](#subcommands)
  - [file](#file)
- [YAML Recipe](#yaml-recipe)
- [Go Function Overview](#go-function-overview)
  - [ParseMeetings Function](#parsemeetings-function)
  - [Supporting Functions and Structures](#supporting-functions-and-structures)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `parse` command is designed to process data files, particularly JSON files generated from a YAML recipe, by running a parser that extracts and processes specific information. The `file` subcommand is the primary tool for this purpose, invoking the `ParseMeetings` function to handle meeting data.

## Usage

```bash
magic-mix parse [command] [flags]
```

The `parse` command requires a subcommand to specify the parsing operation.

## Subcommands

### file

The `file` subcommand runs the `ParseMeetings` function on an input file, typically a JSON file generated from a previous data download.

**Usage:**

```bash
magic-mix parse file [inputfile] [flags]
```

**Arguments:**

- **inputfile**: The JSON file to be parsed. This file should contain meeting data structured according to the YAML recipe.

**Examples:**

- **Parse a Meeting Data File:**

  ```bash
  magic-mix parse file meetings.json
  ```

  This command processes the `meetings.json` file, parsing the meeting data and generating a new output file with timeslot information.

## YAML Recipe

The following is an example of a YAML recipe that could be used to generate the input data file for the `ParseMeetings` function:

```yaml
parentUrl: https://graph.microsoft.com/v1.0/places/microsoft.graph.room?$top=2000
childUrls:
  - url: https://graph.microsoft.com/v1.0/users/{{.emailAddress}}/calendar/calendarView?startDateTime=2024-01-01T00:00:00Z&endDateTime=2025-01-01T00:00:00Z&top=500&select=subject,organizer,start,end
    prefix: calendarview-2024
  - url: https://graph.microsoft.com/v1.0/users/{{.emailAddress}}/calendar/calendarView?startDateTime=2023-01-01T00:00:00Z&endDateTime=2024-01-01T00:00:00Z&top=500&select=subject,organizer,start,end
    prefix: calendarview-2023
```

This YAML configuration defines how data should be downloaded and structured, setting the stage for the `ParseMeetings` function to process it.

## Go Function Overview

### ParseMeetings Function

The `ParseMeetings` function is the core of the `file` subcommand. It reads and processes meeting data from a JSON file, generating timeslot information for each booking.

**Functionality:**

- Opens and reads the input JSON file.
- Parses the data into a Go structure.
- Processes each booking, extracting relevant information such as start and end times.
- Generates timeslots for each booking.
- Writes the processed data to an output JSON file (`booking_timeslots_output.json`).

**Sample Code Snippet:**

```go
func ParseMeetings(inputfile string) {
    // Read and parse JSON file
    ...
    // Process each booking
    ...
    // Write the result to the output JSON file
    ...
}
```

### Supporting Functions and Structures

- **RoomData, Booking, Room, Timeslot, TimeslotEntry, BookingOutput**: These structs represent the data structure used to store and manipulate the parsed meeting data.

- **generateTimeslots**: This helper function calculates the timeslots for a booking based on the start and end times.

**Sample Timeslot Calculation:**

```go
func generateTimeslots(start, end time.Time) []TimeslotEntry {
    interval := 15 * time.Minute
    var timeslots []TimeslotEntry
    ...
    return timeslots
}
```

## Examples

Here are some examples of how to use the `parse` command:

- **Parse a JSON File for Meeting Data:**

  ```bash
  magic-mix parse file meetings.json
  ```

  This command parses the `meetings.json` file, processing the data and generating an output file with detailed timeslot information.

## Flags

The `file` subcommand itself does not require any specific flags, but you can use common flags such as `-h` for help.

- `-h, --help`: Displays help information for the `file` subcommand.

## Global Flags

The following global flags can be used with any command in the Magic Mix CLI:

- `-o, --output string`: Specifies the output format (e.g., json, yaml, xml).
- `-v, --verbose`: Enables verbose output, providing more detailed information during execution.

## Error Handling

### Common Errors

If the input file is missing or incorrectly formatted, the `ParseMeetings` function will log an error and terminate the process. Common issues include:

- **File Not Found**: If the specified input file does not exist, the function will log an error and exit.
- **JSON Parsing Errors**: If the JSON data is malformed, the function will log an error and exit.

### Handling Specific Scenarios

- Ensure the input file is correctly formatted according to the expected structure (as defined by the YAML recipe).
- If errors occur during parsing or file operations, check the console logs for detailed error messages.
