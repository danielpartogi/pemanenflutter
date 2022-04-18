import 'package:flutter/material.dart';
import 'package:pemanen_flutter/core/app_image.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/image_name.dart';
import 'package:pemanen_flutter/core/assets/strings.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/data/block.dart';
import 'package:pemanen_flutter/presentation/harvester/bottomsheet/add_block_widget.dart';

import 'harvester_detail_list.dart';

class HarvesterDetail extends StatelessWidget {
  HarvesterDetail({Key? key}) : super(key: key);

  final GlobalKey<HarvesterDetailListState> _harvesterListKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: FloatingActionButton(
            child: const Icon(Icons.add),
            backgroundColor: AppColor.primary500,
            onPressed: () {
              _addUpdateBlock(context);
            }),
      ),
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
            HarvesterDetailList(
              key: _harvesterListKey,
              onUpdate: (value, index) {
                _addUpdateBlock(context, block: value, index: index);
              },
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _blockInfo() {
    return [
      Text(
        Strings.blockYesterday,
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
                Strings.dummyName,
                style: AppStyle.headingMedium(),
              ),
              Text(
                Strings.dummyNumber,
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
      margin: const EdgeInsets.only(top: 8),
      height: 32,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(right: 4),
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
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
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
                Strings.dateHarvest,
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
                    Strings.dummyDate,
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
                Strings.harvestResult,
                style: AppStyle.label(weight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                Strings.dummyHarvestResult,
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

  void _addUpdateBlock(BuildContext context, {Block? block, int? index}) {
    showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return WillPopScope(
            child: AddBlockWidget(
              block: block,
              index: index,
            ),
            onWillPop: () async => false,
          );
        }).then((value) => {_harvesterListKey.currentState?.refreshList()});
  }
}
