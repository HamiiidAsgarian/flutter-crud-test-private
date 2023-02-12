// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class SupabaseDataSource {
  Future<CustomerModel> getCustomer(CustomerModel customer);
  void addCustomer(CustomerModel customer);
  void deleteCustomer(CustomerModel customer);
  void updateCustomer(CustomerModel customer);
  // Stream<List<Map<String, dynamic>>> getCustomersStream();
  Stream<List<CustomerModel>> getCustomersStream();
}

class SupabaseDataSourceImp implements SupabaseDataSource {
  final SupabaseClient supaBaseClient;
  SupabaseDataSourceImp({
    required this.supaBaseClient,
  });
  // static String supabaseUrl = 'https://ssifxdfwgwqnssvexnfk.supabase.co';
  // static String supabaseKey =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzaWZ4ZGZ3Z3dxbnNzdmV4bmZrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU5NTAyNzgsImV4cCI6MTk5MTUyNjI3OH0.dSe6n3F9ovW3-_vbBJZakfTMdTb5kEp_lHwP9RUWcMk';

  // final _client = SupabaseClient(supabaseUrl, supabaseKey);
  @override
  Stream<List<CustomerModel>> getCustomersStream() {
    // Stream myStream = Stream.fromIterable(elements)

    Stream<List<CustomerModel>> modeledStream = supaBaseClient
        .from('customers')
        .stream(primaryKey: ['id']).map((listOfStreamData) {
      return listOfStreamData
          .map((e) => CustomerModel(
              id: e['id'],
              firstname: e['firstname'],
              lastname: e['lastname'],
              dateOfBirth: e['dateOfBirth'],
              phoneNumber: e['phoneNumber'],
              email: e['email'],
              bankAccountNumber: e['bankAccountNumber']))
          .toList();
      // for (var e in listOfStreamData) {
      //   return
      // }
    });

    // return supaBaseClient.from('customers').stream(primaryKey: ['id']);
    return modeledStream;
  }

  @override
  void addCustomer(CustomerModel customer) async {
    List validation1 = await supaBaseClient.from("customers").select("*").match(
        {"firstname": customer.firstname, "lastname": customer.lastname});

    List validation2 = await supaBaseClient
        .from("customers")
        .select("*")
        .eq("email", customer.email);

    if (validation1.isNotEmpty || validation2.isNotEmpty) {
    } else {
      await supaBaseClient.from('customers').insert({
        'firstname': customer.firstname,
        'lastname': customer.lastname,
        'dateOfBirth': customer.dateOfBirth,
        'phoneNumber': customer.phoneNumber,
        'email': customer.email,
        'bankAccountNumber': customer.bankAccountNumber,
      });
    }
  }

  @override
  void deleteCustomer(CustomerModel customer) async {
    await supaBaseClient.from('customers').delete().match({'id': customer.id});
  }

  @override
  void updateCustomer(CustomerModel customer) async {
    await supaBaseClient.from('customers').update({
      'firstname': customer.firstname,
      'lastname': customer.lastname,
      'dateOfBirth': customer.dateOfBirth,
      'phoneNumber': customer.phoneNumber,
      'email': customer.email,
      'bankAccountNumber': customer.bankAccountNumber,
    }).eq('id', customer.id);
  }

  @override
  Future<CustomerModel> getCustomer(CustomerModel customer) async {
    var fountCustomer = await supaBaseClient
        .from('customers')
        .delete()
        .match({'id': customer.id});

    CustomerModel res = CustomerModel(
        id: fountCustomer['id'],
        firstname: fountCustomer["firstname"],
        lastname: fountCustomer["lastname"],
        dateOfBirth: fountCustomer["dateOfBirth"],
        phoneNumber: fountCustomer["phoneNumber"],
        email: fountCustomer["email"],
        bankAccountNumber: fountCustomer["bankAccountNumber"]);
    return res;
  }
}

//-----------------------------------------
// class SupabaseDataSource2 {
//   static String supabaseUrl = 'https://ssifxdfwgwqnssvexnfk.supabase.co';
//   static String supabaseKey =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzaWZ4ZGZ3Z3dxbnNzdmV4bmZrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU5NTAyNzgsImV4cCI6MTk5MTUyNjI3OH0.dSe6n3F9ovW3-_vbBJZakfTMdTb5kEp_lHwP9RUWcMk';

//   final _client = SupabaseClient(supabaseUrl, supabaseKey);

//   addData(CustomerEntity customer) async {
//     var res = await _client.from('customers').insert({
//       'firstname': customer.firstname,
//       'lastname': customer.lastname,
//       'dateOfBirth': customer.dateOfBirth,
//       'phoneNumber': customer.phoneNumber,
//       'email': customer.email,
//       'bankAccountNumber': customer.bankAccountNumber,
//     });

//     print(res);
//   }

//   read(CustomerEntity customer) async {
//     var res =
//         await _client.from('customers').select().order('id', ascending: true);

//     final List dataList = res.data as List;
//     print(res);
//   }

//   update(CustomerEntity customer) async {
//     var res = await _client.from('customers').update({
//       'firstname': customer.firstname,
//       'lastname': customer.lastname,
//       'dateOfBirth': customer.dateOfBirth,
//       'phoneNumber': customer.phoneNumber,
//       'email': customer.email,
//       'bankAccountNumber': customer.bankAccountNumber,
//     }).match({'firstname': customer.firstname}).eq('id', customer.id);

//     print(res);
//   }

//   delete(CustomerEntity customer) async {
//     await _client.from('customers').delete().match({'id': customer.id});
//   }
// }
