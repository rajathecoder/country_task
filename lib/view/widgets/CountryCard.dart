// lib/widgets/country_card.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';
import '../../model/country_model/country_model.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract currency name safely
    String currencyName = 'N/A';
    if (country.currencies.isNotEmpty) {
      currencyName = country.currencies.values.first.name;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Wrap the flag image in a Hero widget
            Hero(
              tag: country.name.common, // Unique tag based on the country name
              child: CachedNetworkImage(
                imageUrl: country.flags.png,
                width: 80,
                height: 50,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  width: 80,
                  height: 50,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, size: 50),
              ),
            ),
            const SizedBox(width: 16.0),
            // Country Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.name.common,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Official: ${country.name.official}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Currency: $currencyName',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
