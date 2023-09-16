import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';


void main() {
  group("{{name.pascalCase()}}Response ", () {
    const tModel = {{name.pascalCase()}}Response( );
    test("should return valid response ", () {
      //act
      const result = tModel;
      //expect
      expect(result, equals(tModel));
    });
    test("should return fromJson ", () {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture("{{name.snakeCase()}}_response.json"));
      // act
      final result = {{name.pascalCase()}}Response.fromJson(jsonMap);
      // assert
      expect(result, equals(tModel));
    });

    test("should return toJson", () {
      //act
      final result = tModel.toJson();
      // expect
      final expectedToJsonMap = jsonDecode(fixture("{{name.snakeCase()}}_response.json"));
      expect(result, equals(expectedToJsonMap));
    });
  });
}
