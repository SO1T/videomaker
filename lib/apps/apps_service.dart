import 'package:videomaker/apps/bloc/apps_state.dart';
import 'package:videomaker/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<List<App>> getAllApps() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final apps = FirebaseFirestore.instance.collection('apps');
  final data = await apps.get().then(
        (value) => value.docs.map((doc) {
          final title = doc.data()['title'] as String;
          final price = doc.data()['price'] as String;
          final description = doc.data()['description'] as String;
          final logo = doc.data()['logo'] as String;
          final link = doc.data()['link'] as String;
          final category = List<String>.from(doc.data()['category']);
          return App(
            title: title,
            price: price,
            description: description,
            logo: logo,
            link: link,
            category: category,
          );
        }),
      );

  return data.toList();
}
