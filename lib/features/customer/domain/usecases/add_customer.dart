import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

import '../../../core/error/failures.dart';

class AddCustomers {
  final DomainApiRepo domainApiRepo;
  AddCustomers(this.domainApiRepo);

  Future<Either<CustomerEntity, ServerRespond>> exeute(
      CustomerEntity customer) async {
    // Either<CustomerEntity, ServerRespond> res =
    //     await domainApiRepo.addCustomer(customer);
    return domainApiRepo.addCustomer(customer);
  }
}
