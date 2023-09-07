#!/bin/bash

file_path="functions/dart_edge/main.dart.js"
prefix="import { Client } from \"https://deno.land/x/postgres@v0.17.0/mod.ts\";"
old_string="self\.Client"
new_string="Client"

echo "$prefix" | cat - "$file_path" > temp_file && mv temp_file "$file_path"

sed -i "" "s/$old_string/$new_string/g" "$file_path"
