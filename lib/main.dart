import 'package:flutter/material.dart';

import 'features/core/consts.dart';
import 'features/customer/presentation/pages/home_page.dart';

void main() async {
  await AppConsts().initDatabase();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppConsts.mainTheme, home: const MainPage());
  }
}
