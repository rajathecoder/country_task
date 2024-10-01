// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/translatecontroller/translatecontroller.dart';
import '../../widgets/CountryCard.dart';
import '../countrydetails/countrydetails.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CountryController countryController = Get.put(CountryController());
  bool isSearching = false;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? const Text('Country Information')
            : TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
            });
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search Country",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.clear : Icons.search),
            onPressed: () {
              setState(() {
                if (isSearching) {
                  searchQuery = '';
                }
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: Obx(() {
        if (countryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (countryController.error.isNotEmpty) {
          return Center(child: Text(countryController.error.value));
        }

        // Filter the countries based on search query
        final filteredCountries = countryController.countries.where((country) {
          return country.name.common.toLowerCase().contains(searchQuery);
        }).toList();

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: filteredCountries.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to CountryDetailScreen when a country is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryDetailScreen(
                      country: filteredCountries[index], // Pass the selected country
                    ),
                  ),
                );
              },
              child: CountryCard(country: filteredCountries[index]),
            );
          },
        );
      }),
    );
  }
}
