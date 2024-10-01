// lib/controllers/country_controller.dart

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/country_model/country_model.dart';
import '../../service/network/url_services.dart';

class CountryController extends GetxController {
  var countries = <Country>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  Future<void> fetchCountries() async {
    try {
      isLoading(true);
      List<Country> tempCountries = [];

      for (String country in UrlService.countries) {
        final response = await http.get(Uri.parse('${UrlService.BASE_URL}/$country'));

        if (response.statusCode == 200) {
          List<dynamic> data = json.decode(response.body);
          if (data.isNotEmpty) {
            tempCountries.add(Country.fromJson(data[0]));
          } else {
            Get.snackbar('Data Error', 'No data found for $country',
                snackPosition: SnackPosition.BOTTOM);
          }
        } else {
          Get.snackbar('Network Error', 'Failed to load data for $country',
              snackPosition: SnackPosition.BOTTOM);
        }
      }

      countries.assignAll(tempCountries);
    } catch (e) {
      error('An error occurred: $e');
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
