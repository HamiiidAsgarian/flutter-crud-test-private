import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/core/consts.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

class InfoDialouge extends StatelessWidget {
  const InfoDialouge({Key? key, required this.customer}) : super(key: key);
  final CustomerEntity customer;
  @override
  Widget build(BuildContext context) {
    TextStyle sectionTextStyle = Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: AppConsts.greyColor1);
    return SimpleDialog(
      titlePadding: const EdgeInsets.only(left: 25),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Customer Info",
            style: TextStyle(color: AppConsts.greyColor1),
          ),
          CupertinoButton(
            child: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text("id: ${customer.id}", style: sectionTextStyle),
            Text("Name : ${customer.firstname}", style: sectionTextStyle),
            const SizedBox(height: 5),
            Text("lastname : ${customer.lastname}", style: sectionTextStyle),
            const SizedBox(height: 5),
            Text("email : ${customer.email}", style: sectionTextStyle),
            const SizedBox(height: 5),
            Text("phoneNumber : ${customer.phoneNumber}",
                style: sectionTextStyle),
            const SizedBox(height: 5),
            Text("bankAccountNumber : ${customer.bankAccountNumber}",
                style: sectionTextStyle),
            const SizedBox(height: 5),
            Text("dateOfBirth : ${customer.dateOfBirth}",
                style: sectionTextStyle),
          ],
        )
      ],
    );
  }
}
