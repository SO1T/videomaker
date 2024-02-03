import 'package:videomaker/calculator/bloc/calculator_state.dart';
import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
  @override
  List<String> get props => [];
}

class UpdateCameraEvent extends CalculatorEvent {
  const UpdateCameraEvent(this.camera);
  final Camera camera;
  @override
  List<String> get props => [];
}

class UpdateResolutionEvent extends CalculatorEvent {
  const UpdateResolutionEvent(this.resolution);
  final ResolutionToRatio resolution;
  @override
  List<String> get props => [];
}

class UpdateDistanceEvent extends CalculatorEvent {
  const UpdateDistanceEvent({required this.distance});
  final double distance;
  @override
  List<String> get props => [];
}

class GetAllCamerasEvent extends CalculatorEvent {
  const GetAllCamerasEvent();
  @override
  List<String> get props => [];
}
