import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

import '../../../core/error/failures.dart';

class DeleteCustomers {
  final DomainApiRepo domainApiRepo;
  DeleteCustomers(this.domainApiRepo);

  Future<Either<CustomerEntity, ServerRespond>> exeute(
      CustomerEntity customer) async {
    return domainApiRepo.deleteCustomer(customer);
  }
}
