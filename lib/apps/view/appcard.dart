import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:videomaker/apps/bloc/apps_state.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.app});
  final App app;

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
                app.logo,
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
                      app.title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      app.description,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: 'Додаток для: ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFffffff),
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: app.category.join(', '),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w700,
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
                        text: 'Вартість: ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFffffff),
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: app.price,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FilledButton(
                      onPressed: () => _launchUrl(app.link),
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
                      child: const Text('Завантажити'),
                    )
                  ],
                ),
              ),
            ],
          )
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
