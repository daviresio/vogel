import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class Settings {
  //This variable will store haveibeenpwned api key
  static late String darkWebApiKey;
  static const darkWebUrl = 'https://haveibeenpwned.com/api/v3/breachedaccount';

  //Read .env file and get values from it
  static Future<void> loadEnvFile() async {
    await dot_env.load(fileName: '.env');
    darkWebApiKey = dot_env.env['HAVEIBEENPWNED_API_KEY']!;
  }
}
