import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider/screens/home_screen.dart';
import 'package:rest_api_with_provider/utils/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
