import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

class AddCustomers {
  final DomainApiRepo domainApiRepo;
  AddCustomers(this.domainApiRepo);

  void exeute(CustomerEntity customer) {
    return domainApiRepo.addCustomer(customer);
  }
}
