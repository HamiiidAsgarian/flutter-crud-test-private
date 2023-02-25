import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    int? id,
    String? firstname,
    String? lastname,
    String? dateOfBirth,
    String? phoneNumber,
    String? email,
    String? bankAccountNumber,
  }) : super(
            id: id,
            firstname: firstname,
            lastname: lastname,
            dateOfBirth: dateOfBirth,
            phoneNumber: phoneNumber,
            email: email,
            bankAccountNumber: bankAccountNumber);

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      dateOfBirth: json['dateOfBirth'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      bankAccountNumber: json['bankAccountNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['dateOfBirth'] = dateOfBirth;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['bankAccountNumber'] = bankAccountNumber;
    return data;
  }
}
