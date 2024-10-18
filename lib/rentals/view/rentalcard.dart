import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:videomaker/rental_details/rentaldetails.dart';
import 'package:videomaker/rentals/bloc/rentals_state.dart';
import 'package:videomaker/utills/urllauncher.dart';

class RentalCard extends StatefulWidget {
  const RentalCard({super.key, required this.rental});
  final Rental rental;

  @override
  State<RentalCard> createState() => _RentalCardState();
}

class _RentalCardState extends State<RentalCard> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.setAnalyticsCollectionEnabled(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RentalDetail(
                            rental: widget.rental,
                          ),
                        ),
                      );
                      await analytics.logEvent(
                          name: 'rental_page',
                          parameters: {"rental_name": widget.rental.title});
                    },
                    child: Image(
                      image: CachedNetworkImageProvider(
                        widget.rental.logo,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RentalDetail(
                                  rental: widget.rental,
                                ),
                              ),
                            );
                            await analytics.logEvent(
                                name: 'rental_page',
                                parameters: {
                                  "rental_name": widget.rental.title
                                });
                          },
                          child: Text(
                            widget.rental.title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: 'Місто: ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: widget.rental.city,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Умови видачі: ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: widget.rental.guarantee.join(', '),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => launchUrlHelper('tel:${widget.rental.phone}'),
                    child: RichText(
                      text: TextSpan(
                        text: 'Телефон: ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: widget.rental.phone,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RentalDetail(
                            rental: widget.rental,
                          ),
                        ),
                      );
                      await analytics.logEvent(
                          name: 'rental_page',
                          parameters: {"rental_name": widget.rental.title});
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      side: const BorderSide(
                        width: 3.0,
                        color: Colors.white,
                      ),
                    ),
                    child: const Text('Детальніше'),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
