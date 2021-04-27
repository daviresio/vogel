import 'package:dio/dio.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';

Future<List<BreachedAccountModel>?> searchUnprotectedData({
  required String value,
}) async {
  try {
    var url =
        'https://haveibeenpwned.com/api/v3/breachedaccount/$value?truncateResponse=false';
    var response = await Dio().get(
      url,
      options: Options(
        headers: {
          'hibp-api-key': '50e33344953546d1847e871f51098a35',
        },
        validateStatus: (int? statusCode) =>
            statusCode != null && (statusCode >= 200 && statusCode < 300) ||
            statusCode == 404,
      ),
    );

    if (response.statusCode == 404) {
      return [];
    }

    var result = List<BreachedAccountModel>.from(
      (response.data)
          .map((element) => BreachedAccountModel.fromJson(element))
          .toList(),
    );
    return result;
  } catch (e) {
    print(e);
    return null;
  }
}
