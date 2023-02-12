import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

class UpdateCustomers {
  final DomainApiRepo domainApiRepo;
  UpdateCustomers(this.domainApiRepo);

  void exeute(CustomerEntity customer) async {
    domainApiRepo.updateCustomer(customer);
  }
}
