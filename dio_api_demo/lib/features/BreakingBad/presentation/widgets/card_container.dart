import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardContainer extends StatelessWidget {
  final BreakingBadCharacterModel item;

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
                  "${item.appearance.toString()}\n${item.betterCallSaulAppearance.toString()}\n${item.birthday.toString()}\n${item.category.toString()}\n${item.charId.toString()}\n${item.img.toString()}\n${item.name.toString()}\n${item.nickname.toString()}")
            ],
          ),
        ));
  }
}
