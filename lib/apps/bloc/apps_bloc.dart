import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videomaker/apps/bloc/apps_event.dart';
import 'package:videomaker/apps/bloc/apps_state.dart';
import 'package:videomaker/apps/apps_service.dart';

class AppsBloc extends Bloc<AppsEvent, AppsStateUpdate> {
  AppsBloc() : super(const AppsStateUpdate()) {
    on<GetAllAppsEvent>(_mapGetAllCamerasEventToState);
  }

  Future<void> _mapGetAllCamerasEventToState(
    GetAllAppsEvent event,
    Emitter<AppsStateUpdate> emit,
  ) async {
    try {
      final apps = await getAllApps();
      emit(state.copyWith(allApps: apps));
    } catch (e) {
      rethrow;
    }
  }
}
