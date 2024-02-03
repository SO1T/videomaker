import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResolutionToRatio {
  ResolutionToRatio({
    required this.ratio,
    required this.resolution,
  });
  final String ratio;
  final String resolution;
}

class Camera {
  Camera({required this.title, required this.resolutionToRatio});

  Camera.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : title = snapshot.data()['title'] as String,
        resolutionToRatio = [];
  final String title;
  final List<ResolutionToRatio> resolutionToRatio;
}

@immutable
abstract class CalculatorState {
  const CalculatorState({
    this.allCameras,
    this.camera,
    this.resolution,
    this.distance,
    this.result,
  });
  final List<Camera>? allCameras;
  final Camera? camera;
  final ResolutionToRatio? resolution;
  final double? distance;

  final String? result;

  CalculatorState copyWith({
    List<Camera> allCameras,
    Camera camera,
    ResolutionToRatio? resolution,
    double? distance,
    String? result,
  });
}

class CalculatorStateUpdate extends CalculatorState {
  const CalculatorStateUpdate({
    super.camera,
    super.resolution,
    super.distance,
    super.result,
    super.allCameras,
  });

  @override
  CalculatorStateUpdate copyWith({
    List<Camera>? allCameras,
    Camera? camera,
    ResolutionToRatio? resolution,
    double? distance = 0,
    String? result = '',
  }) {
    return CalculatorStateUpdate(
      allCameras: allCameras ?? this.allCameras,
      camera: camera ?? this.camera,
      resolution: resolution ?? this.resolution,
      distance: distance ?? this.distance,
      result: result ?? this.result,
    );
  }
}
