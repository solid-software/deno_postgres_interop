import 'package:prisma/deno_postgres_interop.dart';
import 'package:supabase_functions/supabase_functions.dart';

void main() => SupabaseFunctions(fetch: fetch);

Future<Response> fetch(Request _) async {
  final dbUrl = Deno.env.get('SUPABASE_DB_URL');
  if (dbUrl == null) return Response.error();

  final client = Client(dbUrl);
  final transaction = client.createTransaction('transaction');

  await transaction.begin();
  await transaction.queryObject(
    'UPDATE public."User" '
    "SET username='user${client.hashCode}' "
    "WHERE last_name='user'",
  );
  await Future.delayed(const Duration(seconds: 10));
  final result = await transaction.queryObject('SELECT * FROM public."User"');
  await transaction.commit();

  await client.end();

  return Response(result.rows.map(rowToPrettyString).join('\n\n'));
}

String rowToPrettyString(Map<String, dynamic> row) => row
    .toString()
    .replaceAll(', ', '\n')
    .replaceAllMapped(RegExp(r'\{|\}'), (_) => '');