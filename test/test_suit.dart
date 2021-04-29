import 'dart:convert';

import 'package:test/test.dart';

void jsonSerializationTest(fromJson, toJson) {
  expect(jsonEncode(fromJson), equals(jsonEncode(toJson)));
}

void jsonToJsonTest(Map toJson, Map json) {
  toJson.forEach((key, value) {
    expect(json, contains(key));
    expect(value, isNotNull);
  });
}

void toJsonJsonTest(Map toJson, Map json) {
  json.forEach((key, value) {
    expect(toJson, contains(key));
  });
}
