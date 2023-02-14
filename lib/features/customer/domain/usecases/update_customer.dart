import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

import '../../../core/error/failures.dart';

class UpdateCustomers {
  final DomainApiRepo domainApiRepo;
  UpdateCustomers(this.domainApiRepo);

  Future<Either<CustomerEntity, ServerRespond>> exeute(
      CustomerEntity customer) async {
    return domainApiRepo.updateCustomer(customer);
  }
}
