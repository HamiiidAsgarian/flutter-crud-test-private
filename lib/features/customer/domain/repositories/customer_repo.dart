import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DomainApiRepo {
  Stream<List<CustomerEntity>> getUsersStream();
  Future<Either<Failure, CustomerEntity>> getUsers();
  void addUser(CustomerEntity customer);
  void deleteUser(CustomerEntity customer);
  void update(CustomerEntity customer);
}
