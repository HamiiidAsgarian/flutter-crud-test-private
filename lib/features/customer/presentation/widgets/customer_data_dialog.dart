import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/core/consts.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

import '../../../core/validator.dart';

enum DialogStyle { addCustomer, editCustomer }

class CustomerDataDialog extends StatefulWidget {
  const CustomerDataDialog(
      {Key? key,
      // required this.databaseclient,
      this.defultCustomer,
      this.dialogStyle = DialogStyle.addCustomer,
      required this.onAdmit})
      : super(key: key);

  // final SupabaseClient databaseclient;
  final CustomerEntity? defultCustomer;
  final DialogStyle dialogStyle;
  final Function(CustomerEntity newCustomer) onAdmit;

  @override
  State<CustomerDataDialog> createState() => _CustomerDataDialogState();
}

class _CustomerDataDialogState extends State<CustomerDataDialog> {
  final _formKey = GlobalKey<FormState>();

  String _firstname = "";
  String _lastname = "";
  String _dateOfBirth = "";
  String _phoneNumber = "";
  String _email = "";
  String _bankAccountNumber = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      // backgroundColor: Color.fromRGBO(189, 189, 189, 1),
      titlePadding: const EdgeInsets.only(left: 25),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.dialogStyle == DialogStyle.addCustomer
              ? const Text(
                  "Customer Insert",
                  style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
                )
              : const Text(
                  "Customer Update",
                  style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
                ),
          CupertinoButton(
            child: Icon(
              Icons.close,
              color: widget.dialogStyle == DialogStyle.editCustomer
                  ? AppConsts.mainGreenColor
                  : AppConsts.mainBlueColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: AppConsts.greyColor1),
                    initialValue: widget.dialogStyle == DialogStyle.editCustomer
                        ? widget.defultCustomer!.firstname
                        : null,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) =>
                        Validators.stringInputsValidator(value),
                    onSaved: (value) {
                      value != null ? _firstname = value : () {};
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: AppConsts.greyColor1),
                    initialValue: widget.dialogStyle == DialogStyle.editCustomer
                        ? widget.defultCustomer!.lastname
                        : null,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) =>
                        Validators.stringInputsValidator(value),
                    onSaved: (value) {
                      if (value != null || value != "") {
                        _lastname = value!;
                      }
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: AppConsts.greyColor1),
                    initialValue: widget.dialogStyle == DialogStyle.editCustomer
                        ? widget.defultCustomer!.dateOfBirth
                        : null,
                    decoration: const InputDecoration(
                        hintText: "dd/mm/yyyy", labelText: 'birthday'),
                    validator: (value) => Validators.birthDayValidator(value),
                    onSaved: (value) {
                      value != null ? _dateOfBirth = value : () {};
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: AppConsts.greyColor1),
                    initialValue: widget.dialogStyle == DialogStyle.editCustomer
                        ? widget.defultCustomer!.phoneNumber
                        : null,
                    decoration: const InputDecoration(
                        hintText: "+98**********", labelText: 'Phone Number'),
                    validator: (value) =>
                        Validators.phoneNumberValidator(value),
                    onSaved: (value) {
                      value != null ? _phoneNumber = value : () {};
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: AppConsts.greyColor1),
                    initialValue: widget.dialogStyle == DialogStyle.editCustomer
                        ? widget.defultCustomer!.email
                        : null,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) => Validators.emailValidator(value),
                    onSaved: (value) {
                      value != null ? _email = value : () {};
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: AppConsts.greyColor1),
                    initialValue: widget.dialogStyle == DialogStyle.editCustomer
                        ? widget.defultCustomer!.bankAccountNumber
                        : null,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Bank Account Number'),
                    validator: (value) =>
                        Validators.bankAccountValidator(value),
                    onSaved: (value) {
                      value != null ? _bankAccountNumber = value : () {};
                    },
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                          color: widget.dialogStyle == DialogStyle.editCustomer
                              ? AppConsts.mainGreenColor
                              : AppConsts.mainBlueColor,
                          child: widget.dialogStyle == DialogStyle.editCustomer
                              ? const Text("Update")
                              : const Text("Insert"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              CustomerEntity newCustomer = CustomerEntity(
                                  id: widget.defultCustomer != null
                                      ? widget.defultCustomer!.id
                                      : null,
                                  firstname: _firstname,
                                  lastname: _lastname,
                                  dateOfBirth: _dateOfBirth,
                                  phoneNumber: _phoneNumber,
                                  bankAccountNumber: _bankAccountNumber,
                                  email: _email);
                              widget.onAdmit(newCustomer);
                            }
                          }),
                    ],
                  ),
                ]))),
      ],
    );
  }
}
