import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pemanen_flutter/core/app_image.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/image_name.dart';
import 'package:pemanen_flutter/core/assets/strings.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/presentation/harvester/choose_line_widget.dart';

class HarvesterDetail extends StatelessWidget {
  const HarvesterDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary500,
        title: Text(
          Strings.titleHarvesterDetail,
          style: AppStyle.headline6(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._buildProfileHeader(),
            const SizedBox(
              height: 32,
            ),
            ..._buildHarvesterInfoHeader(),
            const SizedBox(
              height: 28,
            ),
            ..._blockInfo(),
            const SizedBox(
              height: 44,
            ),
            _buildDivider(),
            // _notFoundBlock(),
ChooseLineWidget()
          ],
        ),
      ),
    );
  }

  List<Widget> _blockInfo() {
    return [
      Text(
        "Block Panen Kemarin",
        style: AppStyle.label(weight: FontWeight.bold),
      ),
      _buildPastBlock()
    ];
  }

  List<Widget> _buildProfileHeader() {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AppImage.loadLocalImage(ImageName.profile),
            width: 56,
            height: 56,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sulaiman Johan",
                style: AppStyle.headingMedium(),
              ),
              Text(
                "293019293",
                style: AppStyle.body(textColor: AppColor.mediumEmphasis),
              )
            ],
          )
        ],
      )
    ];
  }

  Container _buildPastBlock() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 32,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(right: 4),
              width: 46,
              height: 32,
              child: Center(
                child: Text(
                  "A0${index + 1}",
                  style: AppStyle.label(textColor: AppColor.primary500),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary500),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            );
          }),
    );
  }

  List<Widget> _buildHarvesterInfoHeader() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Panen Tanggal",
                style: AppStyle.label(weight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image(image: AppImage.loadLocalImage(ImageName.calendar)),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "10 Agustus 2021",
                    style: AppStyle.label(),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Panen Tanggal",
                style: AppStyle.label(weight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "2.31 Ha 5.800 Kg 784 Jjg",
                style: AppStyle.label(),
              ),
            ],
          )
        ],
      ),
    ];
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      color: AppColor.black200,
      height: 1,
    );
  }

  Widget _notFoundBlock() {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AppImage.loadLocalImage(ImageName.notFoundBlock)),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Mutu Ancak Masih \nKosong",
            style: AppStyle.body(
                textColor: AppColor.mediumEmphasis, weight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
