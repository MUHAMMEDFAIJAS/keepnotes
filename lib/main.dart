import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keepnotes/controller/notes_controller.dart';
import 'package:keepnotes/firebase_options.dart';
import 'package:keepnotes/view/login_screen.dart';
import 'package:keepnotes/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => notesController(),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
