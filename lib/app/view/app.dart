import 'package:videomaker/apps/view/apps.dart';
import 'package:videomaker/calculator/calculator.dart';
import 'package:videomaker/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:videomaker/memory/memory.dart';
import 'package:videomaker/rentals/rentals.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
        fontFamily: 'Fact',
      ),
      routes: {
        '/focus-factor': (context) => const CalculatorPage(),
        '/apps': (context) => const AppsPage(),
        '/rentals': (context) => const RentalsPage(),
        '/memory': (context) => const MemoryPage()
      },
      home: const HomeView(),
    );
  }
}
