import 'package:lesson19/src/source/new_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchToIds returns  a list of ids', () async {
    final newApi = NewsApiProvider();
    newApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4, 5]), 200);
      });

    final ids = await newApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4, 5]);
    }
  );
}