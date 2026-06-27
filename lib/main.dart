import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/district_explorer_screen.dart';
import 'package:flutter_application_2/screens/login_screen.dart';
import 'package:flutter_application_2/services/auth_service.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DeshExplorerApp());
}

class DeshExplorerApp extends StatelessWidget {
  const DeshExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeshExplorer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.primary,
          surface: AppColors.card,
        ),
        scaffoldBackgroundColor: AppColors.background,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
      ),
      home: AuthService.currentUser == null
          ? const LoginScreen()
          : const DistrictExplorerScreen(),
      routes: {
        '/login': (_) => const LoginScreen(),
      },
    );
  }
}
