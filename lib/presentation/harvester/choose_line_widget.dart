import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/core/custom_number_picker.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class ChooseLineWidget extends StatefulWidget {
  const ChooseLineWidget({Key? key}) : super(key: key);

  @override
  State<ChooseLineWidget> createState() => _ChooseLineWidgetState();
}

class _ChooseLineWidgetState extends State<ChooseLineWidget> {

  int selectedLine = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColor.primary100
      ),
      child: Center(
        child: CustomNumberPicker(
            axis: Axis.horizontal,
            itemCount: 5,
            minValue: 1,
            maxValue: 50,
            selectedTextStyle: AppStyle.nominal(),
            textStyle: AppStyle.headingLarge(),
            itemWidth: 60,
            itemHeight: 64,
            value: selectedLine,
            onChanged: (value) {
              setState(() {
                selectedLine = value;
              });
            }),
      ),
    );
  }
}
