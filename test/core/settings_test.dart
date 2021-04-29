import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dot_env.load(fileName: '.env_test');

  test('Need have a haveibeenpwned api key', () {
    var apiKey = dot_env.env['HAVEIBEENPWNED_API_KEY'];
    expect(apiKey, isNotNull);
  });
}
