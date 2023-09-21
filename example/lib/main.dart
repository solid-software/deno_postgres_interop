import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/deno_postgres_interop.dart';
import 'package:supabase_functions/supabase_functions.dart';

void main() => SupabaseFunctions(fetch: fetch);

Future<Response> fetch(Request _) async {
  final dbUrl = Deno.env.get('SUPABASE_DB_URL');
  if (dbUrl == null) return Response.error();

  final client = Client(dbUrl);
  await client.connect();
  try {
    final result = await client.transaction(
      'transaction',
      transaction,
      TransactionOptions(isolationLevel: IsolationLevel.serializable),
    );
    await client.end();

    return Response(
      [
        result.command == CommandType.select,
        'warnings = ${result.warnings}',
        '''
rowDescription =
  columnCount = ${result.rowDescription?.columnCount}
  columns =
${result.rowDescription?.columns.map((e) => '    name = ${e.name}').join('\n')}
      ''',
        result.query.resultType,
        ...result.rows.map(rowToPrettyString),
      ].join('\n\n'),
    );
  } on TransactionError catch (e) {
    await client.end();

    return Response('''
${e.name}
${e.cause}
  ${e.cause.name}
  ${e.cause.cause}
  ${e.cause.message}
  ${e.cause.fields}
${e.message}
$e
''');
  }
}

Future<QueryObjectResult<dynamic>> transaction(Transaction transaction) async {
  await transaction.queryObject(
    'UPDATE public."User" '
    r'SET username=$1 '
    "WHERE last_name='user'"
    'AND y = z',
    ["'user${transaction.hashCode}'"],
  );
  await Future.delayed(const Duration(seconds: 10));

  return transaction.queryObject('SELECT * FROM public."User"');
}

String rowToPrettyString(Map<String, dynamic> row) => row
    .toString()
    .replaceAll(', ', '\n')
    .replaceAllMapped(RegExp(r'\{|\}'), (_) => '');

/// [js/Error](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error).
@JS('Error')
class JSError {
  /// [js/Error/name](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name).
  external String get name;

  /// [js/Error/cause](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause).
  external Error? get cause;

  /// [js/Error/message](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message).
  external String get message;
}
