import 'package:country_task/service/network/url_services.dart';
import 'package:dio/dio.dart';

import '../../utils/helper/logger.helper.dart';

class ApiSerivce {
  static final Dio _dio = Dio();
  
  static Future<Map<String, dynamic>> get({
    required String slug,
  }) async {
    Map<String, dynamic> json = {};

    try {
      var response = await _dio.get('${UrlService.BASE_URL}/$slug');
      json = response.data;
      logger.w(json);
      return json;
    } catch (e) {
      logger.e(e);
    }
    return json;
  }

  static Future<Map<String, dynamic>> post(
      {String? slug, Map<String, dynamic>? data}) async {
    Map<String, dynamic> result = {};
    try {
      var response = await _dio.post('${UrlService.BASE_URL}$slug',
          data: data,
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          ));
      logger.w(response.data);

      if (response.statusCode == 200) {
        result = response.data;
        return result;
      }
    } catch (e) {
      logger.e(e);
    }
    return result;
  }
}
