import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:videomaker/rentals/bloc/rentals_state.dart';

class RentalCard extends StatelessWidget {
  const RentalCard({super.key, required this.rental});
  final Rental rental;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                rental.logo,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rental.title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      rental.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(link) async {
  if (!await launchUrl(
    Uri.parse('https://apps.apple.com/app/id$link'),
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $link');
  }
}
