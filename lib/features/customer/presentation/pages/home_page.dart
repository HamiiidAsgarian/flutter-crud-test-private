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
    ///Getting  database client from singleton class AppConsts
    _client = AppConsts().client!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomerDataDialog(
                    dialogStyle: DialogStyle.addCustomer,
                    onAdmit: (newCustomer) {
                      AddCustomers(ApiRepoImp(
                              SupabaseDataSourceImp(supaBaseClient: _client)))
                          .exeute(newCustomer);
                    },
                  );
                });
          },
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
                        onPressDelete: (customerIndex) {
                          ///Delete customer through DeleteUsecase
                          DeleteCustomers(ApiRepoImp(SupabaseDataSourceImp(
                                  supaBaseClient: _client)))
                              .exeute(customers[customerIndex]);
                        },
                        onPressEdit: (int customerIndex) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomerDataDialog(
                                  dialogStyle: DialogStyle.editCustomer,
                                  defultCustomer: customers[customerIndex],
                                  onAdmit: (newCustomer) {
                                    UpdateCustomers(ApiRepoImp(
                                            SupabaseDataSourceImp(
                                                supaBaseClient: _client)))
                                        .exeute(newCustomer);
                                  },
                                );
                              });
                        },
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

  onPressInfo() {}
}
