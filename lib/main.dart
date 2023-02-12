import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_bloc.dart';

import 'features/core/consts.dart';
import 'features/customer/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConsts().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomerBloc(),
        ),
      ],
      child: MaterialApp(theme: AppConsts.mainTheme, home: const MainPage()),
    );
  }
}
