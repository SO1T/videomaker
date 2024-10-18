import 'package:videomaker/calculator/bloc/calculator_state.dart';
import 'package:videomaker/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<List<Camera>> getAllMemories() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final cameras = FirebaseFirestore.instance.collection('memory');
  final data = await cameras.get().then(
        (value) => value.docs.map((doc) {
          final cameraTitle = doc.data()['camera'] as String;
          final resolutionToRatioData =
              doc.data()['resolutionToRatio'] as List<dynamic>;
          final resolutionToRatio = resolutionToRatioData
              .map(
                (ratioData) => ResolutionToRatio(
                  ratio: ratioData['ratio'] as String? ?? '',
                  resolution: ratioData['resolution'] as String? ?? '',
                ),
              )
              .toList();
          return Camera(
            title: cameraTitle,
            resolutionToRatio: resolutionToRatio,
          );
        }),
      );

  return data.toList();
}
