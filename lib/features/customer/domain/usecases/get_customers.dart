import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

import '../../../core/error/failures.dart';

class GetCustomers {
  final DomainApiRepo apiRepo;
  GetCustomers(this.apiRepo);

  Future<Either<Failure, CustomerEntity>> exeute() {
    return apiRepo.getCustomer();
  }
}
