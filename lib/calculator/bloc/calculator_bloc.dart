import 'dart:math';

import 'package:videomaker/calculator/bloc/calculator_event.dart';
import 'package:videomaker/calculator/bloc/calculator_state.dart';
import 'package:videomaker/calculator/calculator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorStateUpdate> {
  CalculatorBloc() : super(const CalculatorStateUpdate()) {
    on<UpdateCameraEvent>(_mapUpdateCameraEventToState);
    on<UpdateResolutionEvent>(_mapUpdateResolutionEventToState);
    on<UpdateDistanceEvent>(_mapUpdateDistanceEventToState);
    on<GetAllCamerasEvent>(_mapGetAllCamerasEventToState);
  }

  Future<void> _mapGetAllCamerasEventToState(
    GetAllCamerasEvent event,
    Emitter<CalculatorStateUpdate> emit,
  ) async {
    try {
      final cameras = await getAllCameras();
      emit(state.copyWith(allCameras: cameras));
    } catch (e) {
      rethrow;
    }
  }

  void _mapUpdateDistanceEventToState(
    UpdateDistanceEvent event,
    Emitter<CalculatorStateUpdate> emit,
  ) {
    try {
      final distance = event.distance;
      var result = '';
      if (state.resolution?.ratio != null) {
        result =
            roundDouble(double.parse(state.resolution!.ratio) * distance, 2)
                .toString();
      }
      emit(state.copyWith(
        result: result,
        distance: distance,
        camera: state.camera,
        resolution: state.resolution,
      ));
    } catch (e) {
      rethrow;
    }
  }

  void _mapUpdateResolutionEventToState(
    UpdateResolutionEvent event,
    Emitter<CalculatorStateUpdate> emit,
  ) {
    try {
      final resolution = event.resolution;
      var result = '';
      if (state.distance != null) {
        final focus = double.parse(resolution.ratio) * state.distance!;
        result = roundDouble(focus, 2).toString();
      }
      emit(
        state.copyWith(
          resolution: resolution,
          distance: state.distance,
          result: result,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  void _mapUpdateCameraEventToState(
    UpdateCameraEvent event,
    Emitter<CalculatorStateUpdate> emit,
  ) {
    try {
      final camera = event.camera;
      emit(
        state.copyWith(
          camera: camera,
          resolution: ResolutionToRatio(ratio: '', resolution: ''),
          distance: state.distance,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}

double roundDouble(double value, int places) {
  final mod = pow(10.0, places);
  return (value * mod).round().toDouble() / mod;
}
