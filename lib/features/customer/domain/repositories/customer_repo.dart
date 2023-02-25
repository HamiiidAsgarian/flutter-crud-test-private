import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DomainApiRepo {
  Stream<List<CustomerEntity>> getCustomersStream();

  Future<Either<CustomerEntity, ServerRespond>> getCustomer(
      CustomerEntity customer);

  Future<Either<CustomerEntity, ServerRespond>> addCustomer(
      CustomerEntity customer);

  Future<Either<CustomerEntity, ServerRespond>> deleteCustomer(
      CustomerEntity customer);

  Future<Either<CustomerEntity, ServerRespond>> updateCustomer(
      CustomerEntity customer);
}
