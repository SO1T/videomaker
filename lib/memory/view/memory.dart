import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videomaker/memory/bloc/memory_bloc.dart';
import 'package:videomaker/memory/bloc/memory_event.dart';
import 'package:videomaker/memory/bloc/memory_state.dart';

class MemoryPage extends StatelessWidget {
  const MemoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MemoryBloc()..add(const GetAllMemoryEvent()),
      child: const MemoryView(),
    );
  }
}

class MemoryView extends StatefulWidget {
  const MemoryView({super.key});

  @override
  State<MemoryView> createState() => _MemoryViewState();
}

class _MemoryViewState extends State<MemoryView> {
  final TextEditingController cameraController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SafeArea(
          child: Column(
            children: [
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
                        cameraController.clear();
                        context
                            .read<MemoryBloc>()
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
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0, left: 15),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFFffffff)),
                        ),
                      ),
                      dropdownMenuEntries: List<Camera>.empty().map((camera) {
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
                        'Оберіть формат зйомки',
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
                        cameraController.clear();
                        context
                            .read<MemoryBloc>()
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
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0, left: 15),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFFffffff)),
                        ),
                      ),
                      dropdownMenuEntries: List<Camera>.empty().map((camera) {
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
                        'Оберіть розширеня',
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
                        cameraController.clear();
                        context
                            .read<MemoryBloc>()
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
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0, left: 15),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFFffffff)),
                        ),
                      ),
                      dropdownMenuEntries: List<Camera>.empty().map((camera) {
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
                        'Оберіть бітрейт',
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
                        cameraController.clear();
                        context
                            .read<MemoryBloc>()
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
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0, left: 15),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFFffffff)),
                        ),
                      ),
                      dropdownMenuEntries: List<Camera>.empty().map((camera) {
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
                        'Оберіть кількість кадрів',
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
                        cameraController.clear();
                        context
                            .read<MemoryBloc>()
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
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0, left: 15),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFFffffff)),
                        ),
                      ),
                      dropdownMenuEntries: List<Camera>.empty().map((camera) {
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
                        'Оберіть обєм памяті',
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
                        cameraController.clear();
                        context
                            .read<MemoryBloc>()
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
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0, left: 15),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFFffffff)),
                        ),
                      ),
                      dropdownMenuEntries: List<Camera>.empty().map((camera) {
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
            ],
          ),
        ),
      ),
    );
  }
}
