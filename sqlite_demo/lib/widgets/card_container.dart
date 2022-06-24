import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/cubit/crud_cubit.dart';
import 'package:sqlite_demo/model/clientModel.dart';
import 'package:sqlite_demo/pages/addClient.dart';
import 'package:sqlite_demo/pages/updateClient.dart';

class CardContainer extends StatelessWidget {
  final Client item;

  const CardContainer({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: 1),
        ),
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Id  : ${item.id}",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "First Name  : ${item.firstName}",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Last Name : ${item.lastName}",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateClient(
                                  id: item.id,
                                  firstName: item.firstName,
                                  lastName: item.lastName,
                                ),
                              ),
                            );
                          },
                          child: const Text("Edit"))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CrudCubit>(context)
                                .deleteClient(item.id);
                          },
                          child: const Text("Delete")))
                ],
              )
            ],
          ),
        ));
  }
}
