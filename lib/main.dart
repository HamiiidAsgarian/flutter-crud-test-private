import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/data/datasources/supabase.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_repo_data.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customers_stream.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
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
      child: const MaterialApp(home: MainPage()),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final SupabaseClient _client;
  @override
  void initState() {
    String supabaseUrl = 'https://ssifxdfwgwqnssvexnfk.supabase.co';
    String supabaseKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzaWZ4ZGZ3Z3dxbnNzdmV4bmZrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU5NTAyNzgsImV4cCI6MTk5MTUyNjI3OH0.dSe6n3F9ovW3-_vbBJZakfTMdTb5kEp_lHwP9RUWcMk';

    _client = SupabaseClient(supabaseUrl, supabaseKey);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.amber,
              child: StreamBuilder<List<CustomerEntity>>(
                  stream: GetCustomersStream(ApiRepoImp(
                          SupabaseDataSourceImp(supaBaseClient: _client)))
                      .exeute(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data![1].runtimeType);
                      return Text(snapshot.data.toString());
                    }
                    return const CupertinoActivityIndicator();
                  })),
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Text("add"),
              )
            ],
          )
        ],
      ),
    );
  }
}
