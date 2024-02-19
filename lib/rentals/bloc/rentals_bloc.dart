import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videomaker/rentals/bloc/rentals_event.dart';
import 'package:videomaker/rentals/bloc/rentals_state.dart';
import 'package:videomaker/rentals/rentals_service.dart';

class RentalsBloc extends Bloc<RentalsEvent, RentalsStateUpdate> {
  RentalsBloc() : super(const RentalsStateUpdate()) {
    on<GetAllRentalsEvent>(_mapGetAllRentalsEventToState);
  }

  Future<void> _mapGetAllRentalsEventToState(
    GetAllRentalsEvent event,
    Emitter<RentalsStateUpdate> emit,
  ) async {
    try {
      final rentals = await getAllRentals();
      emit(state.copyWith(allRentals: rentals));
    } catch (e) {
      rethrow;
    }
  }
}
