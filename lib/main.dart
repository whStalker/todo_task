import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_task/screens/event_add_screen.dart';
import 'package:to_do_task/screens/event_info_screen.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:to_do_task/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'event_add_screen': (context) => const EventAddScren(),
        'event_info_screen': (context) => const EventInfoScreen(),
      },
      home: MainScreen(),
    );
  }
}
