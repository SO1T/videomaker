import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class App {
  App({
    required this.title,
    required this.description,
    required this.price,
    required this.logo,
    required this.link,
    required this.category,
  });

  App.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : title = snapshot.data()['title'] as String,
        price = snapshot.data()['price'] as String,
        description = snapshot.data()['description'] as String,
        logo = snapshot.data()['logo'] as String,
        link = snapshot.data()['link'] as String,
        category = snapshot.data()['category'] as List<String>;
  final String title;
  final String price;
  final String description;
  final String logo;
  final String link;
  final List<String> category;
}

@immutable
abstract class AppsState {
  const AppsState({
    this.allApps,
  });
  final List<App>? allApps;

  AppsState copyWith({
    List<App> allApps,
  });
}

class AppsStateUpdate extends AppsState {
  const AppsStateUpdate({
    super.allApps,
  });

  @override
  AppsStateUpdate copyWith({
    List<App>? allApps,
  }) {
    return AppsStateUpdate(
      allApps: allApps ?? this.allApps,
    );
  }
}
