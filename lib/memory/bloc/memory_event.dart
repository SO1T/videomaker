import 'package:equatable/equatable.dart';
import 'package:videomaker/memory/bloc/memory_state.dart';

abstract class MemoryEvent extends Equatable {
  const MemoryEvent();
  @override
  List<String> get props => [];
}

class UpdateCameraEvent extends MemoryEvent {
  const UpdateCameraEvent(this.camera);
  final Camera camera;
  @override
  List<String> get props => [];
}

class UpdateFormatEvent extends MemoryEvent {
  const UpdateFormatEvent(this.format);
  final Format format;
  @override
  List<String> get props => [];
}

class UpdateResolutionEvent extends MemoryEvent {
  const UpdateResolutionEvent(this.resolution);
  final Resolution resolution;
  @override
  List<String> get props => [];
}

class UpdateBitrateEvent extends MemoryEvent {
  const UpdateBitrateEvent(this.bitrate);
  final Bitrate bitrate;
  @override
  List<String> get props => [];
}

class UpdateCadresEvent extends MemoryEvent {
  const UpdateCadresEvent(this.cadres);
  final Cadres cadres;
  @override
  List<String> get props => [];
}

class GetAllMemoryEvent extends MemoryEvent {
  const GetAllMemoryEvent();
  @override
  List<String> get props => [];
}
