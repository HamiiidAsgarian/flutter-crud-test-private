// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/core/error/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class SupabaseDataSource {
  Stream<List<CustomerModel>> getCustomersStream();

  Future<Either<CustomerModel, ServerRespond>> getCustomer(
      CustomerModel customer);

  Future<Either<CustomerModel, ServerRespond>> addCustomer(
      CustomerModel customer);

  Future<Either<CustomerModel, ServerRespond>> deleteCustomer(
      CustomerModel customer);

  Future<Either<CustomerModel, ServerRespond>> updateCustomer(
      CustomerModel customer);
}

class SupabaseDataSourceImp implements SupabaseDataSource {
  final SupabaseClient supaBaseClient;
  SupabaseDataSourceImp({
    required this.supaBaseClient,
  });
  @override

  ///Gets customers stream and turns it into the Customer models
  Stream<List<CustomerModel>> getCustomersStream() {
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
    });
    return modeledStream;
  }

  @override
  Future<Either<CustomerModel, ServerRespond>> addCustomer(
      CustomerModel customer) async {
    List repeatedEmail = await supaBaseClient
        .from("customers")
        .select("*")
        .eq("email", customer.email);

    ///If the email address is already exist, don't bother comparing Fname,Lname and birthday, else get the all three and send the customer model
    if (repeatedEmail.isNotEmpty) {
      return right(ServerFailure());
    } else {
      List validation1 =
          await supaBaseClient.from("customers").select("*").match({
        "firstname": customer.firstname,
        "lastname": customer.lastname,
        'dateOfBirth': customer.dateOfBirth
      });
      if (validation1.isNotEmpty) {
        return right(ServerFailure());
      } else {
        List<Map<String, dynamic>> a =
            await supaBaseClient.from('customers').insert({
          'firstname': customer.firstname,
          'lastname': customer.lastname,
          'dateOfBirth': customer.dateOfBirth,
          'phoneNumber': customer.phoneNumber,
          'email': customer.email,
          'bankAccountNumber': customer.bankAccountNumber,
        }).select();
        CustomerModel customerModel = CustomerModel.fromJson(a.first);
        return left(customerModel);
      }
    }
  }

  @override
  Future<Either<CustomerModel, ServerRespond>> deleteCustomer(
      CustomerModel customer) async {
    try {
      List<Map<String, dynamic>> deletedCustomer = await supaBaseClient
          .from('customers')
          .delete()
          .match({'id': customer.id}).select();

      CustomerModel customerModel =
          CustomerModel.fromJson(deletedCustomer.first);
      return left(customerModel);
    } catch (e) {
      return right(ServerFailure());
    }
  }

  @override
  Future<Either<CustomerModel, ServerRespond>> updateCustomer(
      CustomerModel customer) async {
    try {
      var updatedCustomer = await supaBaseClient
          .from('customers')
          .update({
            'firstname': customer.firstname,
            'lastname': customer.lastname,
            'dateOfBirth': customer.dateOfBirth,
            'phoneNumber': customer.phoneNumber,
            'email': customer.email,
            'bankAccountNumber': customer.bankAccountNumber,
          })
          .eq('id', customer.id)
          .select();

      CustomerModel customerModel =
          CustomerModel.fromJson(updatedCustomer.first);
      return left(customerModel);
    } catch (e) {
      return right(ServerFailure());
    }
  }

  ///NOTE: get is never used duo to the exitance of streaming customers data

  @override
  Future<Either<CustomerModel, ServerRespond>> getCustomer(
      CustomerModel customer) async {
    try {
      var foundCustomer =
          await supaBaseClient.from("customers").select("*").match({
        "firstname": customer.firstname,
        "lastname": customer.lastname,
        "dateOfBirth": customer.dateOfBirth
      });

      CustomerModel customerModel = CustomerModel.fromJson(foundCustomer.first);

      return left(customerModel);
    } catch (e) {
      return right(ServerFailure());
    }
  }
}
