# deno_postgres_interop
[![style: solid](https://img.shields.io/badge/style-solid-orange)](https://pub.dev/packages/solid_lints)
[![deno_postgres_interop](https://nokycucwgzweensacwfy.supabase.co/functions/v1/get_project_badge?projectId=241)](https://nokycucwgzweensacwfy.supabase.co/functions/v1/get_project_url?projectId=241)

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

2. Add the config file (default name is `add_imports.yaml`).
   This file is used to lookup files where the classes are defined.
   ```yaml
   file_url_prefix: 'https://deno.land/x/postgres@v0.17.0/'

   classes_map:
      'query/query.ts':
         - QueryObjectResult
      'mod.ts':
         - QueryClient
         - Client
         - Transaction
   ```

3. Import the package:
   ```dart
   import 'package:deno_postgres_interop/deno_postgres_interop.dart';
   ```

4. Compile the code that uses this package with:
   ```bash
   dart run edge build supabase_functions
   ```

5. Add imports to generated file by calling the script:
   ```bash
   dart run deno_postgres_interop:add_imports \
     --filename=example/functions/dart_edge/main.dart.js [\
     --configpath=add_imports.yaml] #this is the default value
   ```
   Note: your filename may differ from the example

6. You can use the function now.

Note that because of the [bug in dart_edge](https://github.com/invertase/dart_edge/issues/50), SDK versions >= 3.1.0 are not actually supported.
