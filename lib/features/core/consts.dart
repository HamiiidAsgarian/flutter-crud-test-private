import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppConsts {
  static final AppConsts _singleton = AppConsts._internal();
  factory AppConsts() {
    return _singleton;
  }
  AppConsts._internal();

  static Color mainRedColor = const Color.fromARGB(255, 151, 20, 10);
  static Color mainGreenColor = const Color.fromARGB(255, 38, 151, 10);
  static Color mainYellowColor = const Color.fromARGB(255, 151, 142, 10);
  static Color mainBlueColor = const Color.fromARGB(255, 0, 90, 224);

  static Color greyColor1 = const Color(0xFF2C3034);
  static Color greyColor2 = const Color(0xFF212529);

  static ThemeData mainTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 33, 37, 41)),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            color: Color.fromARGB(255, 209, 209, 209),
            fontSize: 12,
            fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
        titleLarge: TextStyle(
            color: Color.fromARGB(255, 209, 209, 209),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ));

  SupabaseClient? _client;
  initDatabase() {
    String supabaseUrl =
        'https://ssifxdfwgwqnssvexnfk.supabase.co'; //NOTE: must be .env secrets
    String supabaseKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzaWZ4ZGZ3Z3dxbnNzdmV4bmZrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU5NTAyNzgsImV4cCI6MTk5MTUyNjI3OH0.dSe6n3F9ovW3-_vbBJZakfTMdTb5kEp_lHwP9RUWcMk';

    _client = SupabaseClient(supabaseUrl, supabaseKey);
    Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  }

  SupabaseClient? get client => _client;
}
