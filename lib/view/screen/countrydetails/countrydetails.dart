// lib/screens/country_detail_screen.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_task/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/country_model/country_model.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  CountryDetailScreen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name.common,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Iconsax.global),
            onPressed: () {
              // Add functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: country.name.common,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: country.flags.png,
                  width: 90.w,
                  height: 25.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    width: 10.w,
                    height: 5.w,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error, size: 50),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                country.name.common,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Style.colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                country.name.official,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Style.colors.primary,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(Iconsax.building_4, 'Capital', country.capital?.join(", ") ?? "N/A"),
            _buildInfoRow(Iconsax.user, 'Population', '${country.population}'),
            _buildInfoRow(Iconsax.map, 'Region', country.region),
            _buildInfoRow(Iconsax.location, 'Subregion', country.subregion),
            _buildInfoRow(Iconsax.money, 'Currency', '${country.currencies?.entries.first.value.name} (${country.currencies?.entries.first.value.symbol})'),
            _buildInfoRow(Iconsax.call, 'Calling Code', '+${country.idd?.root ?? ''}${country.idd?.suffixes.join(", ") ?? ''}'),
            _buildInfoRow(Iconsax.timer, 'Timezones', country.timezones.join(", ")),
            _buildInfoRow(Iconsax.flag, 'Top Level Domain', country.tld.join(", ")),
            _buildInfoRow(Iconsax.link, 'Borders', country.borders?.join(", ") ?? "None"),
            _buildInfoRow(Iconsax.ruler, 'Area', '${country.area} km²'),
            _buildInfoRow(Iconsax.global, 'Continents', country.continents.join(", ")),
            _buildInfoRow(Iconsax.map, 'Google Maps', country.maps?.googleMaps ?? 'N/A', isMapLink: true),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {bool isMapLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Style.colors.blackUi),
          SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Style.colors.blackUi,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: isMapLink && value != 'N/A'
                  ? () => _launchMapUrl(value)
                  : null,
              child: Text(
                value,
                style: TextStyle(
                  color: isMapLink && value != 'N/A'
                      ? Colors.blue // Change color to indicate it's clickable
                      : Style.colors.primary,
                  decoration: isMapLink && value != 'N/A'
                      ? TextDecoration.underline // Underline clickable text
                      : TextDecoration.none,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

}


Future<void> _launchMapUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
