import 'package:flutter/material.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/strings.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/core/custom_number_picker.dart';
import 'package:pemanen_flutter/data/enum/checker_model_enum.dart';

class ChooseLineWidget extends StatelessWidget {
  const ChooseLineWidget(
      {Key? key,
      required this.selectedLine,
      required this.onSelectLine,
      required this.onChangeChecker,
      required this.onBack,
      required this.onCreate,
      required this.isUpdate,
      this.checker = CheckerModelEnum.tunggal})
      : super(key: key);

  final int selectedLine;
  final bool isUpdate;
  final Function(int value) onSelectLine;
  final Function(CheckerModelEnum model) onChangeChecker;
  final CheckerModelEnum checker;
  final VoidCallback onBack;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.checkerBlock,
          style: AppStyle.label(weight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildButtonChooser(),
        const SizedBox(
          height: 16,
        ),
        Text(
          Strings.lineNumber,
          style: AppStyle.label(weight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: AppColor.primary100),
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
                  onSelectLine(value);
                }),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Icon(
              Icons.info,
              color: AppColor.highEmphasis,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              Strings.lineNumberInfo,
              style: AppStyle.caption(weight: FontWeight.w400),
            )
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(child: _buildBottomButton())
      ],
    );
  }

  _buildButtonChooser() {
    return Row(
      children: [
        Expanded(
            child: _buildButtonCheck(
                checker == CheckerModelEnum.tunggal, Strings.single, onTap: () {
          onChangeChecker(CheckerModelEnum.tunggal);
        })),
        Expanded(
            child: _buildButtonCheck(
                checker == CheckerModelEnum.kananKiri, Strings.leftRight, onTap: () {
          onChangeChecker(CheckerModelEnum.kananKiri);
        }))
      ],
    );
  }

  _buildBottomButton() {
    return Row(
      children: [
        Expanded(
            child: _buildButton(
                Strings.back, onBack, AppColor.primary100, AppColor.primary500)),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: _buildButton(isUpdate ? Strings.update : Strings.create, onCreate,
                AppColor.primary500, AppColor.white))
      ],
    );
  }

  Widget _buildButtonCheck(bool isChecked, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: isChecked ? AppColor.primary500 : null,
            border: Border.all(color: AppColor.primary500),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
        height: 48,
        child: Center(
          child: Text(
            text,
            style: AppStyle.body(
                weight: FontWeight.w700,
                textColor: isChecked ? AppColor.white : AppColor.primary500),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(String text, VoidCallback onPressed,
      Color backgroundColor, Color textColor) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 48,
        child: Center(
          child: Text(
            text,
            style: AppStyle.body(weight: FontWeight.w700, textColor: textColor),
          ),
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
    );
  }
}
