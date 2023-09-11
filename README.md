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
1. Compile the code that uses this package with:
   ```bash
   dart run edge build supabase_functions
   ```

2. Add imports from `postgres v0.17.0` to compiled `main.dart.js`, e.g.:
   ```js
   import { Client } from "https://deno.land/x/postgres@v0.17.0/mod.ts";
   ```

3. Replace all constructors to not use `self.`, e.g.:

   `new self.Pool(...)` => `new Pool(...)`

4. You can use the function now.

Note: For steps 2, 3 you can use a script like this:
```bash
#!/bin/bash

file_path="functions/dart_edge/main.dart.js"
prefix="import { Client } from \"https://deno.land/x/postgres@v0.17.0/mod.ts\";"
old_string="self\.Client"
new_string="Client"

echo "$prefix" | cat - "$file_path" > temp_file && mv temp_file "$file_path"

sed -i "" "s/$old_string/$new_string/g" "$file_path"
```
