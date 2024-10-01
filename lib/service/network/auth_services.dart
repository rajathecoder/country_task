// lib/services/country_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/country_model/country_model.dart';

class CountryService {
  static const baseUrl = 'https://restcountries.com/v3.1/translation/';

  Future<Country?> fetchCountry(String countryName) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + countryName));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Country.fromJson(data[0]);
      } else {
        throw Exception('Failed to load country');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
