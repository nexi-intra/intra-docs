---
id: database-operations
title: Database Operations Overview
description: Overview of how database operations are handled in the system, including frontend queries, NATS microservice handling, and PostgreSQL connection.
---

# Database Operations in the System

This document outlines how the Next.js web application interacts with the database using NATS and a microservice called `magic-mix`. The architecture supports defining SQL queries in the frontend, routing through NATS, and dynamically connecting to different databases.

## System Architecture Overview

The system is composed of several components that interact to perform database operations. Below is a high-level architecture view.

```mermaid
graph TD
  Client[Client: Next.js Frontend] -->|SQL Query| Server[Next.js Server]
  Server -->|NATS Publish| NATS[NATS]
  NATS -->|SQL Request| Microservice[Microservice: magic-mix]
  Microservice -->|DB Connection String| PostgreSQL[PostgreSQL: Mix DB]
  PostgreSQL -->|Run Query| TargetDB[Target Database]
  TargetDB -->|Result| PostgreSQL
  PostgreSQL -->|Send JSON Result| Microservice
  Microservice -->|NATS Publish| NATS
  NATS -->|SQL Result| Server
  Server -->|Send JSON| Client
```

### Components

- **Client (Next.js Frontend)**: Defines SQL queries in pure SQL and sends them to the server.
- **Server (Next.js Server)**: Receives the SQL query from the frontend and publishes the request into a NATS subject.
- **NATS**: Message broker that forwards the SQL request to the microservice.
- **Microservice (magic-mix)**: Handles the request, establishes a database connection based on the requested database, executes the SQL query, and sends the result back.
- **PostgreSQL (Mix DB)**: Contains a `connections` table used to map database names to connection strings.
- **Target Database**: The database that the SQL query is executed against.

## Sequence of Operations

The following diagram details the flow of a SQL query from the frontend to the database and back to the frontend.

```mermaid
sequenceDiagram
    box  Internet
        participant Client as Client (Next.js Frontend)
    end
    box gray Magic Box Kubernetes cluster
        participant Server as Server (Next.js)
        participant NATS as NATS
        participant Microservice as Microservice (magic-mix)
    end
    box gray PostgreSQL
        participant PostgreSQL as PostgreSQL (Mix DB)
        participant TargetDB as Target Database
    end

    Client->>Server: Send SQL query
    Server->>NATS: Publish query to NATS
    NATS->>Microservice: Forward SQL request
    Microservice->>PostgreSQL: Get connection string
    PostgreSQL-->>Microservice: Return connection string
    Microservice->>TargetDB: Execute SQL query
    TargetDB-->>Microservice: Return result
    Microservice->>NATS: Publish result to NATS
    NATS->>Server: Forward SQL result
    Server->>Client: Return JSON result


```

### Frontend Query Definition

The frontend allows users to define SQL queries directly in pure SQL. These queries are passed to the server, which routes them into the system.

### NATS Message Handling

The server publishes the SQL query, along with metadata like the actor token and database name, into a NATS subject. NATS is responsible for routing this message to the correct microservice.

### Microservice Processing

The `magic-mix` microservice handles the request by looking up the database connection information in the `connections` table of the `mix` PostgreSQL database. It then establishes a connection to the target database, executes the SQL query, and transforms the result into JSON format.

### Database Connection

The `mix` PostgreSQL database has a `connections` table structured as follows:

- `name`: The name of the database.
- `connection_string`: The connection string for the respective database.

The microservice uses this information to connect to the correct database, run the query, and return the results.

## Database Connectivity

The `magic-mix` service dynamically connects to different databases based on the query request. The PostgreSQL `mix` database holds information about various target databases through its `connections` table. The microservice retrieves the appropriate connection string and establishes a connection.

```mermaid
erDiagram
    CONNECTIONS {
      string name PK
      string connection_string
    }
```

- **Name**: The name of the database.
- **Connection String**: The corresponding connection string used to connect to the database.

---

This concludes the overview of how database operations are made in the system.
