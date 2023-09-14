import 'package:deno_postgres_interop/deno_postgres_interop.dart';
import 'package:supabase_functions/supabase_functions.dart';

void main() => SupabaseFunctions(fetch: fetch);

Future<Response> fetch(Request _) async {
  final dbUrl = Deno.env.get('SUPABASE_DB_URL');
  if (dbUrl == null) return Response.error();

  final client = Client(dbUrl);
  await client.connect();
  final result = await client.transaction(
    'transaction',
    transaction,
    TransactionOptions(isolationLevel: IsolationLevel.serializable),
  );
  await client.end();

  return Response(result.rows.map(rowToPrettyString).join('\n\n'));
}

Future<QueryObjectResult<dynamic>> transaction(Transaction transaction) async {
  await transaction.queryObject(
    'UPDATE public."User" '
    r'SET username=$1 '
    "WHERE last_name='user'",
    ["'user${transaction.hashCode}'" as dynamic],
  );
  await Future.delayed(const Duration(seconds: 10));

  return transaction.queryObject('SELECT * FROM public."User"');
}

String rowToPrettyString(Map<String, dynamic> row) => row
    .toString()
    .replaceAll(', ', '\n')
    .replaceAllMapped(RegExp(r'\{|\}'), (_) => '');
