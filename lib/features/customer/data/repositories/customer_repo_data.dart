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
  Stream<List<CustomerEntity>> getCustomersStream() {
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
  Future<Either<CustomerModel, ServerRespond>> addCustomer(
      CustomerEntity customer) async {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);

    Either<CustomerModel, ServerRespond> serverRes =
        await supabaseDataSource.addCustomer(_customerModel);

    return serverRes;
  }

  @override
  Future<Either<CustomerModel, ServerRespond>> deleteCustomer(
      CustomerEntity customer) async {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);
    Either<CustomerModel, ServerRespond> serverRes =
        await supabaseDataSource.deleteCustomer(_customerModel);

    return serverRes;
  }

  @override
  Future<Either<CustomerModel, ServerRespond>> updateCustomer(
      CustomerEntity customer) async {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);
    Either<CustomerModel, ServerRespond> serverRes =
        await supabaseDataSource.updateCustomer(_customerModel);
    return serverRes;
  }

  @override
  Future<Either<CustomerModel, ServerRespond>> getCustomer(
      CustomerEntity customer) async {
    CustomerModel _customerModel = ModelEntityMapper.entityToModel(customer);
    Either<CustomerModel, ServerRespond> serverRes =
        await supabaseDataSource.getCustomer(_customerModel);
    return serverRes;
  }
}

class ModelEntityMapper {
  static CustomerModel entityToModel(CustomerEntity entity) {
    return CustomerModel(
        id: entity.id,
        firstname: entity.firstname,
        lastname: entity.lastname,
        dateOfBirth: entity.dateOfBirth,
        phoneNumber: entity.phoneNumber,
        email: entity.email,
        bankAccountNumber: entity.bankAccountNumber);
  }
}
