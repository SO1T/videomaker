import 'package:equatable/equatable.dart';

abstract class RentalsEvent extends Equatable {
  const RentalsEvent();
  @override
  List<String> get props => [];
}

class GetAllRentalsEvent extends RentalsEvent {
  const GetAllRentalsEvent();
  @override
  List<String> get props => [];
}
