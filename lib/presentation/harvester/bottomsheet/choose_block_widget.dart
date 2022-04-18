import 'package:flutter/material.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/strings.dart';
import 'package:pemanen_flutter/core/assets/style.dart';

class ChooseBlockWidget extends StatelessWidget {
   const ChooseBlockWidget({Key? key, this.onSelectBlock}) : super(key: key);

  final Function(int index)? onSelectBlock;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onSelectBlock?.call(index);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: AppColor.black50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${Strings.block} : A$index ",
                    style: AppStyle.body(weight: FontWeight.w700),
                  ),
                  const Icon(Icons.chevron_right, color: AppColor.black500,)
                ],
              ),
              height: 56,
            ),
          );
        });
  }
}
