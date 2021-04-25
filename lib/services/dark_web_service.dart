import 'package:dio/dio.dart';

void searchUnprotectedData() async {
  try {
    var response = await Dio().get(
      'https://haveibeenpwned.com/api/v3/breachedaccount/000285',
      options: Options(
        headers: {
          'hibp-api-key': '50e33344953546d1847e871f51098a35',
          'user-agent': 'iPhone',
        },
      ),
    );
    print(response);
  } catch (e) {
    print(e);
  }
}
