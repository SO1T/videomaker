import 'package:flutter/material.dart';

class Cadres {
  final String title;
  final String gbtime;

  const Cadres({required this.title, required this.gbtime});
}

class Bitrate {
  final String title;
  final List<Cadres> numberOfCadres;

  const Bitrate({required this.title, required this.numberOfCadres});
}

class Resolution {
  final String title;
  final List<Bitrate> bitrate;

  const Resolution({required this.title, required this.bitrate});
}

class Format {
  final String title;
  final List<Resolution> resolutions;

  const Format({required this.title, required this.resolutions});
}

class Camera {
  final String title;
  final List<Format> format;

  const Camera({required this.title, required this.format});
}

@immutable
abstract class MemoryState {
  const MemoryState(
      {this.allCameras,
      this.format,
      this.resolution,
      this.bitrate,
      this.cadres,
      this.camera});
  final List<Camera>? allCameras;
  final Camera? camera;
  final Format? format;
  final Resolution? resolution;
  final Bitrate? bitrate;
  final Cadres? cadres;

  MemoryState copyWith({
    final List<Camera> allCameras,
    final Format? format,
    final Resolution? resolution,
    final Bitrate? bitrate,
    final Cadres? cadres,
    final Camera? camera,
  });
}

class MemoryStateUpdate extends MemoryState {
  const MemoryStateUpdate({
    super.allCameras,
    super.bitrate,
    super.cadres,
    super.format,
    super.resolution,
    super.camera,
  });

  @override
  MemoryStateUpdate copyWith({
    List<Camera>? allCameras,
    Camera? camera,
    Format? format,
    Resolution? resolution,
    Bitrate? bitrate,
    Cadres? cadres,
  }) {
    return MemoryStateUpdate(
        allCameras: allCameras ?? this.allCameras,
        camera: camera ?? this.camera,
        format: format ?? this.format,
        resolution: resolution ?? this.resolution,
        bitrate: bitrate ?? this.bitrate,
        cadres: cadres ?? this.cadres);
  }
}
