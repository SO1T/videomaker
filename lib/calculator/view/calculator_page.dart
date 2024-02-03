import 'package:videomaker/calculator/bloc/calculator_bloc.dart';
import 'package:videomaker/calculator/bloc/calculator_event.dart';
import 'package:videomaker/calculator/bloc/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc()..add(const GetAllCamerasEvent()),
      child: const CalculatorView(),
    );
  }
}

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController colorController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state =
        context.select((CalculatorBloc calculator) => calculator.state);
    final allCameras = state.allCameras ?? [];
    final resolutions = state.camera?.resolutionToRatio ?? [];
    var ratio = '';
    var result = '';
    if (state.result != null && state.result != '') {
      result = state.result!;
    }
    if (state.resolution?.ratio != null && state.resolution?.ratio != '') {
      ratio = state.resolution!.ratio;
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Розрахунок',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFffffff),
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'Фокусної відстані для різних камер',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Wrap(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Оберіть модель вашої камери',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFFffffff),
                          ),
                        ),
                      ),
                      DropdownMenu<Camera>(
                        width: MediaQuery.of(context).size.width * 0.9,
                        requestFocusOnTap: false,
                        onSelected: (camera) {
                          colorController.clear();
                          context
                              .read<CalculatorBloc>()
                              .add(UpdateCameraEvent(camera!));
                        },
                        textStyle: const TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFFffffff),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 15),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xFFffffff)),
                          ),
                        ),
                        dropdownMenuEntries: allCameras.map((camera) {
                          return DropdownMenuEntry(
                            value: camera,
                            label: camera.title,
                            style: MenuItemButton.styleFrom(
                              foregroundColor: const Color(0xFF000000),
                              textStyle: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Fact',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Wrap(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Оберіть бажане розширення відео',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFFffffff),
                          ),
                        ),
                      ),
                      DropdownMenu<ResolutionToRatio>(
                        width: MediaQuery.of(context).size.width * 0.9,
                        requestFocusOnTap: false,
                        controller: colorController,
                        enabled: state.camera != null,
                        onSelected: (resolution) {
                          context
                              .read<CalculatorBloc>()
                              .add(UpdateResolutionEvent(resolution!));
                        },
                        textStyle: const TextStyle(
                          color: Color(0xFFffffff),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFFffffff)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFFffffff)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xFFffffff)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFFffffff)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusColor: const Color(0xFFffffff),
                        ),
                        dropdownMenuEntries: resolutions.map(
                          (resolution) {
                            return DropdownMenuEntry(
                              value: resolution,
                              label: resolution.resolution,
                              style: MenuItemButton.styleFrom(
                                foregroundColor: const Color(0xFF000000),
                                textStyle: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Fact',
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Фокусна відстань вашої лінзи',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  var result = value;
                                  if (value.isEmpty) {
                                    result = '0';
                                  }
                                  context.read<CalculatorBloc>().add(
                                        UpdateDistanceEvent(
                                          distance: double.parse(result),
                                        ),
                                      );
                                },
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: Color(0xFFffffff),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 33,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFF000000),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFffffff),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, bottom: 0, left: 15),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFffffff),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFffffff),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Center(
                              child: Text(
                                'mm',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 33,
                                  color: Color(0xFFffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  children: [
                    const Wrap(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Результат',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'в перерахунку на Full Frame',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFFffffff),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Кроп фактор',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFffffff),
                                ),
                              ),
                              Text(
                                ratio,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Фокусна відстань',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFffffff),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  result,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
