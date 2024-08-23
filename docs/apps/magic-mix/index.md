---
title: Magic Mix CLI
description: A comprehensive guide to using the Magic Mix CLI, a versatile tool for data operations, including importing, parsing, copying, moving data, and providing microservices for data access.
author: nielsgregers
date: 2024-08-23
version: 1.0.0
repository: https://github.com/magicbutton/magic-mix
license: MIT
tags:
  - CLI
  - Data Operations
  - Microservices
  - Go
  - Cobra
---

# Magic Mix CLI

The Magic Mix CLI is a versatile tool for handling various data operations, including importing, parsing, copying, moving data, and providing microservices for data access. This documentation covers the installation, usage, and available commands of the CLI.

## Installation

To install the Magic Mix CLI, clone the repository and build the tool using Go:

```bash
git clone https://github.com/magicbutton/magic-mix.git
cd magic-mix/.koksmat/app
go build -o magic-mix
```

Make sure you have Go installed on your system before proceeding with the build.

## Database

The CLI is depended on a PostGres database. I assume that your are able to get the credentials for that.

[https://github.com/jackc/tern](https://github.com/jackc/tern) is used for handling database migrations.

> Tern is a standalone migration tool for PostgreSQL. It includes traditional migrations as well as a separate optional workflow for managing database code such as functions and views.

Here is a configuration file example, that has to be placed in the folder `tern`

```bash
cd magic-mix/.koksmat/app/database/tern
```

This assume that you have a managed postgres database in Azure.

Save the this into a file called `tern.conf`

```text
[database]
host = XXXXXXX.postgres.database.azure.com
port = 5432
database =mix
user = pgadmin
password = *****************
sslmode = prefer
```

Install `tern`

```bash

go install github.com/jackc/tern/v2@latest
```

then run the migration

```bash

tern migrate
```

## Environment

Create a file called `.env` in the current folder.

```
APPCLIENT_ID=xxxxxxx
APPCLIENT_SECRET=xxxxxx
APPCLIENT_DOMAIN=xxxxx
POSTGRES_DB=postgres://pgadmin:*****************!@mXXXXXXX.postgres.database.azure.com:5432/mix?sslmode=require
```

## Getting Started

Once installed, you can start using the Magic Mix CLI by typing `magic-mix` followed by the desired command. You can get help for any command by typing:

```bash
magic-mix help [command]
```

## Contributing

If you'd like to contribute to Magic Mix, please fork the repository, create a new branch, and submit a pull request. Contributions are welcome!

## License

Magic Mix is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
