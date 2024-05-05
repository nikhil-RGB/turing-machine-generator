import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:turing_machines/models/TuringMachines.dart';
import 'package:turing_machines/screens/TableScreen.dart';
import 'package:turing_machines/testing.dart';
import 'package:turing_machines/models/Targets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
// import 'package:hive/hive.dart';

Targets target = MyApp.detectPlatform();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox("turing_machines");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TuringMachine machine = Testing.main();
    //for debugging
    Logger().i(target.name);
    return MaterialApp(
      title: 'Turing Machine Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.sourceCodeProTextTheme(),
      ),
      home: TableScreen(machine: machine),
    );
  }

  //detects current platform and returns an enum value representing it
  static Targets detectPlatform() {
    if (kIsWeb) {
      return Targets.WEB;
    } else if (Platform.isAndroid) {
      return Targets.ANDROID;
    } else if (Platform.isLinux | Platform.isMacOS | Platform.isWindows) {
      return Targets.DESKTOP;
    } else {
      return Targets.UNDEFINED;
    }
  }
}
