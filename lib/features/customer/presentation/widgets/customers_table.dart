import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/consts.dart';
import '../../domain/entities/customer.dart';

class CustomersTableList extends StatelessWidget {
  const CustomersTableList({
    Key? key,
    required this.customers,
    this.onPressDelete,
    this.onPressEdit,
    this.onPressInfo,
  }) : super(key: key);

  final List<CustomerEntity> customers;

  final Function(int index)? onPressDelete;
  final Function(int index)? onPressEdit;
  final Function(int index)? onPressInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: index.isEven ? AppConsts.greyColor1 : AppConsts.greyColor2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("$index",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                          "${customers[index].firstname} ${customers[index].lastname}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text("${customers[index].email}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Row(
                children: [
                  SizedBox(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          color: AppConsts.mainRedColor,
                          onPressed: () {
                            onPressDelete != null
                                ? onPressDelete!(index)
                                : () {};
                          },
                          child: const Icon(
                            Icons.close_outlined,
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          color: AppConsts.mainGreenColor,
                          onPressed: () {
                            onPressEdit != null ? onPressEdit!(index) : () {};
                          },
                          child: const Icon(
                            Icons.edit_note_outlined,
                          )),
                    ),
                  ),
                  IconButton(
                      color: AppConsts.mainYellowColor,
                      onPressed: () {
                        onPressInfo != null ? onPressInfo!(index) : () {};
                      },
                      icon: const Icon(
                        Icons.info_outline,
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: double.infinity,
      color: AppConsts.greyColor1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("#", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(width: 20),
              Text("Customer", style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 40),
            child: Text("Email", style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(
              // color: Colors.amber,
              width: 125,
              child: Center(
                child: Text("Actions",
                    style: Theme.of(context).textTheme.titleLarge),
              ))
        ],
      ),
    );
  }
}
