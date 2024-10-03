---
id: auto-run
title: Auto Run Command
sidebar_label: Run
hide_sidebar: true
---

# `koksmat auto run`

The `run` subcommand under the `auto` command is used to initiate and manage an autopilot session in the Koksmat environment. This command executes a series of automated tasks defined in the session, interacting with the Magic Button Studio API.

## Usage

```bash
koksmat auto run [sessionId] [rooturl]
```

This command runs the autopilot mode with a specific session ID and optionally, a root URL for the Magic Button Studio.

### Parameters

- `sessionId`: The ID of the session to be run in autopilot mode. This is a required parameter.
- `rooturl`: The base URL of the Magic Button Studio. This is optional; if not provided, the command will use the URL configured in the environment.

## Functionality

The `run` command does the following:

- Retrieves the bearer token using the `auth.GetToken()` method.
- Constructs the API URL for the autopilot session.
- Continuously makes requests to the API to check for actions to be performed, such as "ping," "execute," "execute-nostream," or "write."
- Handles the actions by calling respective handlers like `handlePing`, `handleExecute`, and others.
- Automatically refreshes the bearer token every 10 minutes to ensure continued access.

### Example

```bash
koksmat auto run V1StGXR8_Z5jdHi6B-myT
```

This example starts the autopilot session with the ID `V1StGXR8_Z5jdHi6B-myT` using the default root URL configured in your environment.

## Actions

The following actions are handled by the `run` command:

### `ping`

Handled by `handlePing`, this action responds with a "pong" to keep the session alive.

### `execute`

Handled by `handleExecute`, this action executes a command with arguments in the context of the autopilot session. It streams the output back to the session.

### `execute-nostream`

Handled by `handleExecuteNoStream`, this action executes a command without streaming the output. Instead, the result is sent back in one complete response.

### `write`

Handled by `handleWrite`, this action writes data (e.g., files) to the session's context.

## Error Handling

If any errors occur during the execution of these actions, they are logged, and an error response is sent back to the session's API endpoint.

## Additional Information

To get more detailed help or to see additional options, you can use the following syntax:

```bash
koksmat auto run --help
```

This will provide more in-depth information about the available parameters and options for the `run` subcommand.

---

By using the `run` command in autopilot mode, you can automate complex workflows and manage them efficiently in the Koksmat environment.
