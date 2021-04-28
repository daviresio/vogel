import 'package:dio/dio.dart';
import 'package:vogel_app/core/settings.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';

class DarkWebService {
  static final _dio = Dio(
    BaseOptions(baseUrl: Settings.darkWebUrl, headers: {
      'hibp-api-key': Settings.darkWebApiKey,
    }),
  );

  static Future<List<BreachedAccountModel>?> searchUnprotectedData({
    required String value,
  }) async {
    try {
      var url = '/$value?truncateResponse=false';
      var response = await _dio.get(
        url,
        options: Options(
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
}
