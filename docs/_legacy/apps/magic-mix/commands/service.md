---
title: "Service"
description: "Documentation for the service command in the Magic Mix CLI, used to start and manage a NATS microservice instance, including retrieving service statistics."
author: Your Name
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Microservices
  - NATS
  - Service Management
  - Go
  - Cobra
---

# Service Command - Magic Mix CLI

The `service` command in the Magic Mix CLI is used to start a NATS microservice instance. This command is essential for initiating the microservice, allowing it to respond to requests on various endpoints. Additionally, you can easily retrieve detailed statistics about the service using the `nats micro stats magic-mix` command.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [NATS Microservice Information](#nats-microservice-information)
  - [Service Details](#service-details)
  - [Endpoints](#endpoints)
  - [Service Statistics](#service-statistics)
- [Examples](#examples)
- [Flags](#flags)
- [Global Flags](#global-flags)
- [Error Handling](#error-handling)

## Overview

The `service` command starts a NATS microservice instance, which is part of the Magic Mix CLI. The microservice responds to requests on predefined endpoints, facilitating various operations within the Magic Mix ecosystem. The NATS infrastructure enables highly performant, scalable, and reliable communication between services.

## Usage

```bash
magic-mix service [flags]
```

Executing this command will start the microservice responder, which will begin handling requests on its configured endpoints.

## NATS Microservice Information

Once the service is running, you can retrieve detailed information about the service using the `nats micro stats magic-mix` command, which provides an easy-to-read output of the service statistics.

### Service Details

- **Service Name**: `magic-mix`
- **Service ID**: `PhvysvG4BOK1V9f8BPEVD2`
- **Description**: Magic People
- **Version**: 0.0.1

### Endpoints

The service provides several endpoints, each handling different types of requests:

- **app**

  - **Subject**: `magic-mix.app`
  - **Queue Group**: `q`

- **connection**

  - **Subject**: `magic-mix.connection`
  - **Queue Group**: `q`

- **importdata**
  - **Subject**: `magic-mix.importdata`
  - **Queue Group**: `q`

### Service Statistics

The `nats micro stats magic-mix` command gives a clear and concise output of the service statistics, as shown below:

```plaintext
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│                                      magic-mix Service Statistics                                      │
├────────────────────────┬────────────┬──────────┬─────────────┬────────┬─────────────────┬──────────────┤
│ ID                     │ Endpoint   │ Requests │ Queue Group │ Errors │ Processing Time │ Average Time │
├────────────────────────┼────────────┼──────────┼─────────────┼────────┼─────────────────┼──────────────┤
│ PhvysvG4BOK1V9f8BPEVD2 │ app        │ 222      │ q           │ 0      │ 3m26s           │ 928ms        │
│                        │ connection │ 0        │ q           │ 0      │ 0s              │ 0s           │
│                        │ importdata │ 0        │ q           │ 0      │ 0s              │ 0s           │
├────────────────────────┼────────────┼──────────┼─────────────┼────────┼─────────────────┼──────────────┤
│                        │            │ 222      │             │ 0      │ 3m26s           │ 928ms        │
╰────────────────────────┴────────────┴──────────┴─────────────┴────────┴─────────────────┴──────────────╯
```

This output provides a snapshot of the following statistics for each endpoint:

- **Requests**: The number of requests handled by each endpoint.
- **Queue Group**: The queue group handling the requests.
- **Errors**: The number of errors encountered.
- **Processing Time**: The total processing time for requests.
- **Average Time**: The average time taken per request.

## Examples

Here are some examples of how to use the `service` command:

- **Start the Microservice:**

  ```bash
  magic-mix service
  ```

  This command starts the microservice responder, enabling it to handle requests on the configured endpoints.

- **Retrieve Service Statistics:**

  ```bash
  nats micro stats magic-mix
  ```

  This command provides an easy-to-read output of the service statistics, including the number of requests, errors, and processing times for each endpoint.

### Checking Service Status

If you need to verify that the service is running correctly and responding to requests, use the `nats micro stats magic-mix` command to check the current endpoints and their statistics.
