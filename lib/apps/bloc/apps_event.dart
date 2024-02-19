import 'package:equatable/equatable.dart';

abstract class AppsEvent extends Equatable {
  const AppsEvent();
  @override
  List<String> get props => [];
}

class GetAllAppsEvent extends AppsEvent {
  const GetAllAppsEvent();
  @override
  List<String> get props => [];
}
