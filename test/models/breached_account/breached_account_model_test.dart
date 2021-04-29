import 'package:vogel_app/models/breached_account/breached_account_model.dart';
import 'package:test/test.dart';

import '../../test_suit.dart';

void main() {
  var json = {
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
  };

  late BreachedAccountModel fromJson;
  late Map toJson;

  setUpAll(() {
    fromJson = BreachedAccountModel.fromJson(json);
    toJson = fromJson.toJson();
  });

  group('BreachedAccountModel:', () {
    test('Json Serialization', () => jsonSerializationTest(fromJson, toJson));

    test('Should json have the same keys of the toJson and Value isNotNull',
        () => jsonToJsonTest(toJson, json));

    test('Should toJson have the same keys of the json',
        () => toJsonJsonTest(toJson, json));
  });
}
