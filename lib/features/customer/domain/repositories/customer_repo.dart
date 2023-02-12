import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DomainApiRepo {
  Stream<List<CustomerEntity>> getCustomersStream();
  Future<Either<Failure, CustomerEntity>> getCustomer();
  void addCustomer(CustomerEntity customer);
  void deleteCustomer(CustomerEntity customer);
  void updateCustomer(CustomerEntity customer);
}
