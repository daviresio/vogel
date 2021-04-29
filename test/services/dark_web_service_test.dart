import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:vogel_app/core/settings.dart';

void main() {
  late Dio dio;
  late Response<dynamic> response;

  group('DarkWeb Service', () {
    late DioAdapterMockito dioAdapterMockito;

    setUpAll(() {
      dio = Dio();
      dioAdapterMockito = DioAdapterMockito();
      dio.httpClientAdapter = dioAdapterMockito;
    });

    test('searchUnprotectedData needs return BreachedAccount array', () async {
      final responsePayload = jsonEncode([
        {
          'Name': 'Canva',
          'Title': 'Canva',
          'Domain': 'canva.com',
          'BreachDate': '2019-05-24',
          'AddedDate': '2019-08-09T14:24:01Z',
          'ModifiedDate': '2019-08-09T14:24:01Z',
          'PwnCount': 137272116,
          'Description':
              'In May 2019, the graphic design tool website <a href=\"https://support.canva.com/contact/customer-support/may-24-security-incident-faqs/\" target=\"_blank\" rel=\"noopener\">Canva suffered a data breach</a> that impacted 137 million subscribers. The exposed data included email addresses, usernames, names, cities of residence and passwords stored as bcrypt hashes for users not using social logins. The data was provided to HIBP by a source who requested it be attributed to \"JimScott.Sec@protonmail.com\".',
          'LogoPath':
              'https://haveibeenpwned.com/Content/Images/PwnedLogos/Canva.png',
          'DataClasses': [
            'Email addresses',
            'Geographic locations',
            'Names',
            'Passwords',
            'Usernames'
          ],
          'IsVerified': true,
          'IsFabricated': false,
          'IsSensitive': false,
          'IsRetired': false,
          'IsSpamList': false
        }
      ]);

      final responseBody = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      var expected = jsonDecode(responsePayload);

      when(dioAdapterMockito.fetch(any, any, any))
          .thenAnswer((_) async => responseBody);

      response =
          await dio.get('${Settings.darkWebUrl}/user?truncateResponse=false');

      expect(expected, response.data);
    });
  });
}
