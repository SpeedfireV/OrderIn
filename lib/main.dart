import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/variables/colors.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(FoodItemDbAdapter());
  Hive.openBox<List>("history");

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.nunitoSansTextTheme().apply(),
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.secondaryColor,
                background: AppColors.backgroundColor)),
        routerConfig: router,
      ),
    );
  }
}
