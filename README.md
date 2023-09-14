# deno_postgres_interop
[![style: solid](https://img.shields.io/badge/style-solid-orange)](https://pub.dev/packages/solid_lints)
[![$solid_lints](https://nokycucwgzweensacwfy.supabase.co/functions/v1/get_project_badge?projectName=deno_postgres_interop)](https://www.worklog.ai)

The package allows the use
of [Deno Postgres](https://deno.land/x/postgres)
in [Deno Deploy](https://deno.com/deploy)
on [dart_edge](https://docs.dartedge.dev/)
by creating interop bindings for the js library
since other drivers rely on dart:io and don't work there.

The main scenario is Supabase Edge Functions, but it should also work for other cases with dart2js.

## Usage with Supabase edge functions
1. Add dependency in your pubspec.yaml:
   ```yaml
   dependencies:
     deno_postgres_interop: <INSERT LATEST VERSION>
   ```

   or run

   ```bash
   dart pub add deno_postgres_interop
   ```

2. Import the package:
   ```dart
   import 'package:deno_postgres_interop/deno_postgres_interop.dart';
   ```

3. Compile the code that uses this package with:
   ```bash
   dart run edge build supabase_functions
   ```

4. Add imports to generated file by calling the script:
   ```bash
   dart run tools/add_imports/bin/add_imports.dart
     --filename=example/functions/dart_edge/main.dart.js
   ```
   Note: your filename may differ from the example

5. You can use the function now.

## Implemented classes/types/interfaces
- [ ] mod.ts
  - [ ] Client
    - [ ] constructor
      - [ ] with no parameters
      - [x] `ConnectionString`
      - [ ] `ClientOptions`
  - [ ] ConnectionError
  - [ ] Pool
  - [ ] PoolClient
  - [ ] PostgresError
  - [ ] QueryClient
    - [ ] connected
    - [ ] session
    - [ ] closeConnection
    - [ ] resetSessionMetadata
    - [ ] connect
    - [ ] createTransaction
    - [ ] end
    - [ ] queryArray
      - [ ] `(query: string, args?: QueryArguments)`
      - [ ] `(config: QueryOptions)`
      - [ ] `(strings: TemplateStringsArray, ...args: unknown[])`
    - [ ] queryObject
      - [ ] `(query: string, args?: QueryArguments)`
      - [ ] `(config: QueryObjectOptions)`
      - [ ] `(strings: TemplateStringsArray, ...args: unknown[])`
  - [ ] Savepoint
  - [ ] Transaction
    - [ ] isolation_level
    - [ ] savepoints
    - [ ] begin
    - [ ] commit
    - [ ] getSavepoint
    - [ ] getSavepoints
    - [ ] getSnapshot
    - [ ] queryArray
      - [ ] `(strings: TemplateStringsArray, ...args: unknown[])`
      - [ ] `(config: QueryOptions)`
      - [ ] `(strings: TemplateStringsArray, ...args: unknown[])`
    - [ ] queryObject
      - [ ] `(query: string, args?: QueryArguments)`
      - [ ] `(config: QueryObjectOptions)`
      - [ ] `(strings: TemplateStringsArray, ...args: unknown[])`
    - [ ] rollback
      - [ ] `(savepoint?: string | Savepoint)`
      - [ ] `(options?: { savepoint?: string | Savepoint; })`
      - [ ] `(options?: { chain?: boolean; })`
    - [ ] savepoint
  - [ ] TransactionError
  - [ ] ClientOptions
  - [ ] applicationName: string
    - [ ] connection
    - [ ] database
    - [ ] hostname
    - [ ] host_type
    - [ ] options
    - [ ] password
    - [ ] port
    - [ ] tls
    - [ ] user
  - [ ] ConnectionOptions
  - [ ] QueryOobjectOptions
  - [ ] QueryOptions
  - [ ] Session
   - [ ] current_transaction
   - [ ] pid
   - [ ] tls
   - [ ] transport
  - [ ] TLSOptions
  - [x] ConnectionString
  - [x] TransactionOptions

- [ ] deps.ts
- client.ts - see mod.ts
- pool.ts - see mod.ts

