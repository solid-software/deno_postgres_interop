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
   dev_dependencies:
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

4. Add imports from `postgres v0.17.0` to compiled `main.dart.js`, e.g.:
   ```js
   import { Client } from "https://deno.land/x/postgres@v0.17.0/mod.ts";
   ```

5. After imports, initialize constructors

   ```js
   self.Client = Client;
   ```

6. You can use the function now.
