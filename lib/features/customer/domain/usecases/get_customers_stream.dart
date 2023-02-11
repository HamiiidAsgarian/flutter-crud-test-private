import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repo.dart';

class GetCustomersStream {
  final DomainApiRepo domainApiRepo;
  GetCustomersStream(this.domainApiRepo);

  Stream<List<CustomerEntity>> exeute() {
    return domainApiRepo.getUsersStream();
  }
}
