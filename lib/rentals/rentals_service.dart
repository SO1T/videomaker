import 'package:videomaker/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:videomaker/rentals/bloc/rentals_state.dart';

Future<List<Rental>> getAllRentals() async {
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final rentals = FirebaseFirestore.instance.collection('rentals');
    final data = await rentals.get().then(
          (value) => value.docs.map((doc) {
            final id = doc.id;
            final title = doc.data()['title'] ?? '';
            final description = doc.data()['description'] ?? '';
            final address = doc.data()['address'] ?? '';
            final googlemaps = doc.data()['googlemaps'] ?? '';
            final guarantee = List<String>.from(doc.data()['guarantee']);
            final instagram = doc.data()['instagram'] ?? '';
            final logo = doc.data()['logo'] ?? '';
            final phone = doc.data()['phone'] ?? '';
            final techlist = doc.data()['techlist'] ?? '';
            final telegram = doc.data()['telegram'] ?? '';
            final website = doc.data()['website'] ?? '';
            final city = doc.data()['city'] ?? '';

            return Rental(
                id,
                title,
                description,
                logo,
                guarantee,
                phone,
                instagram,
                techlist,
                telegram,
                website,
                address,
                googlemaps,
                city);
          }),
        );

    return data.toList();
  } catch (e) {
    rethrow;
  }
}
