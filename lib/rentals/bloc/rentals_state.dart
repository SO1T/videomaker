import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Rental {
  Rental(
    this.id,
    this.title,
    this.description,
    this.logo,
    this.guarantee,
    this.phone,
    this.instagram,
    this.techlist,
    this.telegram,
    this.website,
    this.address,
    this.googlemaps,
    this.city,
  );

  Rental.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot.data()['title'] as String,
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
        city = snapshot.data()['city'] as String;

  final String id;
  final String title;
  final String description;
  final String logo;
  final List<String> guarantee;
  final String phone;
  final String instagram;
  final String techlist;
  final String telegram;
  final String website;
  final String address;
  final String googlemaps;
  final String city;
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
