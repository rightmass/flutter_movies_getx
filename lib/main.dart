import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/home_binding.dart';
import 'bindings/detail_binding.dart';
import 'views/home_view.dart';
import 'views/detail_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Movies',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(name: HomeView.routeName, page: () => const HomeView(), binding: HomeBinding()),
        GetPage(name: DetailView.routeName, page: () => const DetailView(), binding: DetailBinding(), fullscreenDialog: true),
      ],
      initialRoute: HomeView.routeName,
    );
  }
}