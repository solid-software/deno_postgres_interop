sh compile_supabase_function.sh
mv -f functions/dart_edge/* ../../supabase/functions/dart_edge/
supabase functions serve --no-verify-jwt
