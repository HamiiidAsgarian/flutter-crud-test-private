import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/core/consts.dart';
import 'package:mc_crud_test/features/customer/data/datasources/supabase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customers_stream.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repositories/customer_repo_data.dart';
import '../../domain/entities/customer.dart';
import '../../domain/usecases/add_customer.dart';
import '../../domain/usecases/delete_customer.dart';
import '../../domain/usecases/update_customer.dart';
import '../widgets/customer_data_dialog.dart';
import '../widgets/info_form.dart';
import '../widgets/customers_table.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final SupabaseClient _client;
  @override
  void initState() {
    ///Getting  database client from AppConsts
    _client = AppConsts().client!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: onPressAddCustomer,
          child: const Icon(Icons.add_outlined),
        ),
        appBar: AppBar(title: const Text("Home Screen")),
        body: Column(
          children: [
            const TableHeader(),
            const Divider(height: 2, thickness: 2, color: Colors.white),
            Expanded(
              child: StreamBuilder<List<CustomerEntity>>(

                  ///Getting the stream socket from the usecase
                  stream: GetCustomersStream(ApiRepoImp(
                          SupabaseDataSourceImp(supaBaseClient: _client)))
                      .exeute(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CustomerEntity> customers = snapshot.data!;
                      return CustomersTableList(
                        customers: customers,
                        onPressDelete: (customerIndex) => onPressDeleteCustomer(
                            selectedCustomer: customers[customerIndex]),
                        onPressEdit: (customerIndex) => onPressEditCustomer(
                            customers: customers[customerIndex]),
                        onPressInfo: (int customerIndex) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return InfoDialouge(
                                    customer: customers[customerIndex]);
                              });
                        },
                      );
                    }
                    return const CupertinoActivityIndicator();
                  }),
            ),
          ],
        ));
  }

  onPressDeleteCustomer({required CustomerEntity selectedCustomer}) async {
    await DeleteCustomers(
            ApiRepoImp(SupabaseDataSourceImp(supaBaseClient: _client)))
        .exeute(selectedCustomer)
        .then((res) async {
      res.fold((customerEntity) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppConsts.mainGreenColor,
          content: Text(
              "✔ ${customerEntity.firstname!.toUpperCase()} ${customerEntity.lastname!.toUpperCase()} has been deleted successfully"),
          duration: const Duration(seconds: 3),
        ));
        // Navigator.pop(context);
      }, (serverRespond) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppConsts.mainRedColor,
          content: const Text("❌ Operation error,Unsuccessful"),
          duration: const Duration(seconds: 3),
        ));
      });
    });
  }

  onPressAddCustomer() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomerDataDialog(
            dialogStyle: DialogStyle.addCustomer,
            onAdmit: (newCustomer) async {
              await AddCustomers(ApiRepoImp(
                      SupabaseDataSourceImp(supaBaseClient: _client)))
                  .exeute(newCustomer)
                  .then((res) async {
                res.fold((customerEntity) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppConsts.mainGreenColor,
                    content: Text(
                        "✔ ${customerEntity.firstname!.toUpperCase()} ${customerEntity.lastname!.toUpperCase()} has been created successfully"),
                    duration: const Duration(seconds: 3),
                  ));
                  // Navigator.pop(context);
                }, (serverRespond) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppConsts.mainRedColor,
                    content: const Text("❌ Operation error,Unsuccessful"),
                    duration: const Duration(seconds: 3),
                  ));
                });
              });
            },
          );
        });
  }

  onPressEditCustomer({required CustomerEntity customers}) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomerDataDialog(
            dialogStyle: DialogStyle.editCustomer,
            defultCustomer: customers,
            onAdmit: (newCustomer) async {
              await UpdateCustomers(ApiRepoImp(
                      SupabaseDataSourceImp(supaBaseClient: _client)))
                  .exeute(newCustomer)
                  .then((res) async {
                res.fold((customerEntity) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppConsts.mainGreenColor,
                    content: Text(
                        "✔ ${customerEntity.firstname!.toUpperCase()} ${customerEntity.lastname!.toUpperCase()} has been updated successfully"),
                    duration: const Duration(seconds: 3),
                  ));
                  // Navigator.pop(context);
                }, (serverRespond) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppConsts.mainRedColor,
                    content: const Text("❌ Operation error,Unsuccessful"),
                    duration: const Duration(seconds: 3),
                  ));
                });
              });
            },
          );
        });
  }
}
