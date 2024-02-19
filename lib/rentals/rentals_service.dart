import 'package:videomaker/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:videomaker/rentals/bloc/rentals_state.dart';

Future<List<Rental>> getAllRentals() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final rentals = FirebaseFirestore.instance.collection('rentals');
  final data = await rentals.get().then(
        (value) => value.docs.map((doc) {
          final title = doc.data()['title'] as String;
          final description = doc.data()['description'] as String;
          final address = doc.data()['address'] as String;
          final googlemaps = doc.data()['googlemaps'] as String;
          final guarantee = doc.data()['guarantee'] as List<String>;
          final instagram = doc.data()['instagram'] as String;
          final logo = doc.data()['logo'] as String;
          final phone = doc.data()['phone'] as String;
          final techlist = doc.data()['techlist'] as String;
          final telegram = doc.data()['telegram'] as String;
          final website = doc.data()['website'] as String;
          final whatsapp = doc.data()['whatsapp'] as String;

          return Rental(
              title: title,
              description: description,
              logo: logo,
              address: address,
              googlemaps: googlemaps,
              guarantee: guarantee,
              instagram: instagram,
              phone: phone,
              techlist: techlist,
              telegram: telegram,
              website: website,
              whatsapp: whatsapp);
        }),
      );

  return data.toList();
}
