[![style: solid](https://img.shields.io/badge/style-solid-orange)](https://pub.dev/packages/solid_lints)

[![$solid_lints](https://nokycucwgzweensacwfy.supabase.co/functions/v1/get_project_badge?projectName=deno_postgres_interop)](https://www.worklog.ai)

# deno_postgres_interop
This package was created to be used in supabase edge functions
because existing db-driver/orm packages depend on dart:io.

## Usage
1. Compile the code that uses this package with
   ```bash
   dart run edge build supabase_functions
   ```

2. Add an import(s) to compiled `main.dart.js`
   ```js
   import { Client } from "https://deno.land/x/postgres@v0.17.0/mod.ts";
   ```
   add other imports from `postgres v0.17.0` as necessary for your code

3. Replace all constructors to not use `self.`:

   `new self.Pool(...)` => `new Pool(...)`

4. You can use the function now.

Note: for steps 2, 3 you can use a script like that:
```bash
#!/bin/bash

file_path="functions/dart_edge/main.dart.js"
prefix="import { Client } from \"https://deno.land/x/postgres@v0.17.0/mod.ts\";"
old_string="self\.Client"
new_string="Client"

echo "$prefix" | cat - "$file_path" > temp_file && mv temp_file "$file_path"

sed -i "" "s/$old_string/$new_string/g" "$file_path"
```
