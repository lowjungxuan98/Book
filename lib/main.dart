import 'package:flutter/material.dart';
import 'package:imt_test/view/BookCategory.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Category',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BookCategory(),
    );
  }
}
