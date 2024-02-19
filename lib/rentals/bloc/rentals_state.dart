import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Rental {
  Rental({
    required this.title,
    required this.description,
    required this.address,
    required this.googlemaps,
    required this.guarantee,
    required this.instagram,
    required this.logo,
    required this.phone,
    required this.techlist,
    required this.telegram,
    required this.website,
    required this.whatsapp,
  });

  Rental.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : title = snapshot.data()['title'] as String,
        description = snapshot.data()['description'] as String,
        address = snapshot.data()['address'] as String,
        googlemaps = snapshot.data()['googlemaps'] as String,
        guarantee = snapshot.data()['guarantee'] as List<String>,
        instagram = snapshot.data()['instagram'] as String,
        logo = snapshot.data()['logo'] as String,
        phone = snapshot.data()['phone'] as String,
        techlist = snapshot.data()['techlist'] as String,
        telegram = snapshot.data()['telegram'] as String,
        website = snapshot.data()['website'] as String,
        whatsapp = snapshot.data()['whatsapp'] as String;

  final String title;
  final String description;
  final String logo;
  final List<String> guarantee;
  final String phone;
  final String instagram;
  final String techlist;
  final String telegram;
  final String website;
  final String whatsapp;
  final String address;
  final String googlemaps;
}

@immutable
abstract class RentalsState {
  const RentalsState({
    this.allRentals,
  });
  final List<Rental>? allRentals;

  RentalsState copyWith({
    List<Rental> allRentals,
  });
}

class RentalsStateUpdate extends RentalsState {
  const RentalsStateUpdate({
    super.allRentals,
  });

  @override
  RentalsStateUpdate copyWith({
    List<Rental>? allRentals,
  }) {
    return RentalsStateUpdate(
      allRentals: allRentals ?? this.allRentals,
    );
  }
}
