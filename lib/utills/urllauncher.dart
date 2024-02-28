import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlHelper(link) async {
  if (!await launchUrl(
    Uri.parse(link),
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $link');
  }
}
