import 'package:mc_crud_test/features/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/customer/data/datasources/supabase.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

class ApiRepoImp implements DomainApiRepo {
  final SupabaseDataSource supabaseDataSource; //add  localStorage later

  ApiRepoImp(this.supabaseDataSource);
  @override
  Stream<List<CustomerEntity>> getUsersStream() {
    return supabaseDataSource.getCustomersStream().map((listOfStreamData) {
      return listOfStreamData
          .map((e) => CustomerEntity(
              id: e.id,
              firstname: e.firstname,
              lastname: e.lastname,
              dateOfBirth: e.dateOfBirth,
              phoneNumber: e.phoneNumber,
              email: e.email,
              bankAccountNumber: e.bankAccountNumber))
          .toList();
    });
  }

  @override
  void addUser(CustomerEntity customer) async {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);
    supabaseDataSource.addCustomer(_customerModel);
  }

  @override
  void deleteUser(CustomerEntity customer) {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);
    supabaseDataSource.deleteCustomer(_customerModel);
  }

  @override
  void update(CustomerEntity customer) {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);
    supabaseDataSource.updateCustomer(_customerModel);
  }

  @override
  Future<Either<Failure, CustomerModel>> getUsers() async {
    return await Future.delayed(Duration.zero);
  }
}

class ModelEntityMapper {
  static CustomerModel entityToModel(CustomerEntity entity) {
    return CustomerModel(
        id: entity.id!,
        firstname: entity.firstname!,
        lastname: entity.lastname!,
        dateOfBirth: entity.dateOfBirth!,
        phoneNumber: entity.phoneNumber!,
        email: entity.email!,
        bankAccountNumber: entity.bankAccountNumber!);
  }
}
