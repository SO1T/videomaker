import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect/multiselect.dart';
import 'package:videomaker/rentals/bloc/rentals_bloc.dart';
import 'package:videomaker/rentals/bloc/rentals_event.dart';
import 'package:videomaker/rentals/view/rentalcard.dart';

class RentalsPage extends StatelessWidget {
  const RentalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RentalsBloc()..add(const GetAllRentalsEvent()),
      child: const RentalsView(),
    );
  }
}

class RentalsView extends StatefulWidget {
  const RentalsView({super.key});

  @override
  State<RentalsView> createState() => _RentalsViewState();
}

class _RentalsViewState extends State<RentalsView> {
  List<String> cities = [
    'Операторів',
    'Гаферів',
    'Режисерів',
    'Редакторів',
    'Сценаристів',
    '1AC',
  ];
  List<String> selectedCities = [];
  @override
  Widget build(BuildContext context) {
    final state = context.select((RentalsBloc rentals) => rentals.state);
    final rentalsList = state.allRentals ?? [];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Рентали України',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFffffff),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'оберить рентал який бильше вам підходить',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFffffff),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Оберіть свій напрям у відео',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFffffff),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMultiSelect(
                    options: cities,
                    selectedValues: selectedCities,
                    selected_values_style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        selectedCities = value;
                      });
                    },
                    whenEmpty: 'Оберіть категорію',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFFffffff),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFFffffff),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      contentPadding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 15, right: 10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFffffff),
                          ),
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Expanded(
                child: ListView.builder(
                  itemCount: rentalsList.length,
                  itemBuilder: (context, index) {
                    return RentalCard(rental: rentalsList[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
