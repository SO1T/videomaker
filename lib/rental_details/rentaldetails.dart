import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:videomaker/rentals/bloc/rentals_state.dart';
import 'package:videomaker/utills/expandabletext.dart';
import 'package:videomaker/utills/urllauncher.dart';

class RentalDetail extends StatelessWidget {
  const RentalDetail({super.key, required this.rental});

  final Rental rental;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text(
                            rental.title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: CachedNetworkImageProvider(
                        rental.logo,
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                            text: rental.address,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                            text: rental.guarantee.join(', '),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ExpandableText(
                      text: rental.description,
                      maxLines: 3,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (rental.techlist != '')
                  InkWell(
                    onTap: () => launchUrlHelper(rental.techlist),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'lib/assets/list.png',
                          width: 60,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Перелік техніки в оренду',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Контакти',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => launchUrlHelper(rental.googlemaps),
                      child: RichText(
                        softWrap: true,
                        text: const TextSpan(
                          text: 'Google карти: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: 'перейти в додаток',
                              style: TextStyle(
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
                      height: 5,
                    ),
                    InkWell(
                      onTap: () => launchUrlHelper('tel:${rental.phone}'),
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                          text: 'Телефон: ',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: rental.phone,
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        if (rental.instagram != '')
                          InkWell(
                            onTap: () => launchUrlHelper(rental.instagram),
                            child: Image.asset(
                              'lib/assets/instagram.png',
                              width: 60,
                            ),
                          ),
                        const SizedBox(
                          width: 20,
                        ),
                        if (rental.telegram != '')
                          InkWell(
                            onTap: () => launchUrlHelper(rental.telegram),
                            child: Image.asset(
                              'lib/assets/telegram.png',
                              width: 60,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
