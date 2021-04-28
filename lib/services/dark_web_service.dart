import 'package:dio/dio.dart';
import 'package:vogel_app/core/settings.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';

class DarkWebService {
  //Define a single instance of Dio in this service, setting the baseUrl and api key
  static final _dio = Dio(
    BaseOptions(baseUrl: Settings.darkWebUrl, headers: {
      'hibp-api-key': Settings.darkWebApiKey,
    }),
  );

  //Search for leaked data on haveibeenpwned api, by username or email params
  static Future<List<BreachedAccountModel>?> searchUnprotectedData({
    required String value,
  }) async {
    try {
      //Here truncateResponse=false is used fot get full Json response
      var url = '/$value?truncateResponse=false';
      var response = await _dio.get(
        url,
        options: Options(
          //I do this customValidade to accept 404 response as success, the reason is explained bellow
          validateStatus: (int? statusCode) =>
              statusCode != null && (statusCode >= 200 && statusCode < 300) ||
              statusCode == 404,
        ),
      );
      //If status code is 404, the data will be null, so returns a empty array.
      //haveibeenpwned Api returns this status code 404 if dont find this email/username
      //on their database, so, if dont find, this account dont't has been leaked, so return empty array
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
