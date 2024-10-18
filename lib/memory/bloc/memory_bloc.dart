import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videomaker/memory/bloc/memory_event.dart';
import 'package:videomaker/memory/bloc/memory_state.dart';
import 'package:videomaker/memory/memory_service.dart';

class MemoryBloc extends Bloc<MemoryEvent, MemoryStateUpdate> {
  MemoryBloc() : super(const MemoryStateUpdate()) {
    on<UpdateCameraEvent>(_mapUpdateCameraEventToState);
    on<GetAllMemoryEvent>(_mapGetAllCamerasEventToState);
  }

  Future<void> _mapGetAllCamerasEventToState(
    GetAllMemoryEvent event,
    Emitter<MemoryStateUpdate> emit,
  ) async {
    try {
      final cameras = await getAllMemories();
      emit(state.copyWith(allCameras: []));
    } catch (e) {
      rethrow;
    }
  }

  void _mapUpdateCameraEventToState(
    UpdateCameraEvent event,
    Emitter<MemoryStateUpdate> emit,
  ) {
    try {
      final camera = event.camera;
      emit(
        state.copyWith(
            // camera: camera,
            // resolution: Resolution(ratio: '', resolution: ''),
            // distance: state.distance,
            ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
