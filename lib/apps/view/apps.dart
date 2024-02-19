import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect/multiselect.dart';
import 'package:videomaker/apps/bloc/apps_bloc.dart';
import 'package:videomaker/apps/bloc/apps_event.dart';
import 'package:videomaker/apps/view/AppCard.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppsBloc()..add(const GetAllAppsEvent()),
      child: const AppsView(),
    );
  }
}

class AppsView extends StatefulWidget {
  const AppsView({super.key});

  @override
  State<AppsView> createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView> {
  List<String> categories = [
    'Операторів',
    'Гаферів',
    'Режисерів',
    'Редакторів',
    'Сценаристів',
    '1AC',
  ];
  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    final state = context.select((AppsBloc apps) => apps.state);
    final appsList = state.allApps ?? [];
    final filteredAppsList = appsList.where((el) {
      if (selectedCategories.isEmpty) {
        return true;
      }
      for (var element in selectedCategories) {
        if (el.category.contains(element)) {
          return true;
        }
      }
      return false;
    }).toList();

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
                    'Корисні додатки',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFffffff),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'додатки які допоможуть тобі в роботі',
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
                    options: categories,
                    selectedValues: selectedCategories,
                    selected_values_style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        selectedCategories = value;
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
                  itemCount: filteredAppsList.length,
                  itemBuilder: (context, index) {
                    return AppCard(app: filteredAppsList[index]);
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
