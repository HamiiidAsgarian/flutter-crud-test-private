import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

class DeleteCustomers {
  final DomainApiRepo domainApiRepo;
  DeleteCustomers(this.domainApiRepo);

  void exeute(CustomerEntity customer) {
    return domainApiRepo.deleteUser(customer);
  }
}
