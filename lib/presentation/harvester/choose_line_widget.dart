import 'package:flutter/material.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/core/custom_number_picker.dart';
import 'package:pemanen_flutter/data/checker_model_enum.dart';

class ChooseLineWidget extends StatelessWidget {
  const ChooseLineWidget(
      {Key? key,
      required this.selectedLine,
      required this.onSelectLine,
      required this.onChangeChecker,
      required this.onBack,
      required this.onCreate,
      this.checker = CheckerModelEnum.tunggal})
      : super(key: key);

  final int selectedLine;
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
          "Model Pemeriksaan",
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
          "Nomor Baris",
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
              "Geser ke kanan atau ke kiri untuk memilih",
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
          child: InkWell(
            onTap: () {
              print("tunggal");
              onChangeChecker(CheckerModelEnum.tunggal);
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  color: checker == CheckerModelEnum.tunggal
                      ? AppColor.primary500
                      : null,
                  border: Border.all(color: AppColor.primary500),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4))),
              height: 48,
              child: Center(
                child: Text(
                  "Tunggal",
                  style: AppStyle.body(
                      weight: FontWeight.w700,
                      textColor: checker == CheckerModelEnum.tunggal
                          ? AppColor.white
                          : AppColor.primary500),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () {
            onChangeChecker(CheckerModelEnum.kananKiri);
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: checker == CheckerModelEnum.kananKiri
                    ? AppColor.primary500
                    : null,
                border: Border.all(color: AppColor.primary500),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4))),
            height: 48,
            child: Center(
              child: Text(
                "Kanan Kiri",
                style: AppStyle.body(
                    weight: FontWeight.w700,
                    textColor: checker == CheckerModelEnum.kananKiri
                        ? AppColor.white
                        : AppColor.primary500),
              ),
            ),
          ),
        ))
      ],
    );
  }

  _buildBottomButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onBack();
            },
            child: Container(
              height: 48,
              child: Center(
                child: Text(
                  "Kembali",
                  style: AppStyle.body(
                      weight: FontWeight.w700, textColor: AppColor.primary500),
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.primary100),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: ElevatedButton(
          onPressed: () {
            onCreate();
          },
          child: Center(
            child: Text(
              "Buat",
              style: AppStyle.body(
                  weight: FontWeight.w700, textColor: AppColor.white),
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.primary500)),
        ))
      ],
    );
  }
}
