import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class Settings {
  static late String darkWebApiKey;
  static const darkWebUrl = 'https://haveibeenpwned.com/api/v3/breachedaccount';

  static Future<void> loadEnvFile() async {
    await dot_env.load(fileName: '.env');
    darkWebApiKey = dot_env.env['HAVEIBEENPWNED_API_KEY']!;
  }
}
