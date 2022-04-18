import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemanen_flutter/core/app_image.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/image_name.dart';
import 'package:pemanen_flutter/core/assets/strings.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/data/block.dart';
import 'package:pemanen_flutter/data/enum/checker_model_enum.dart';
import 'package:pemanen_flutter/presentation/harvester/state/harvester_cubit.dart';

class HarvesterDetailList extends StatefulWidget {
  const HarvesterDetailList({Key? key, required this.onUpdate})
      : super(key: key);
  final Function(Block block, int index) onUpdate;

  @override
  State<HarvesterDetailList> createState() => HarvesterDetailListState();
}

class HarvesterDetailListState extends State<HarvesterDetailList> {
  late HarvesterCubit _harvesterCubit;
  List<Block> _listBlock = [];

  @override
  void initState() {
    _harvesterCubit = HarvesterCubit();
    _listBlock = [];
    _harvesterCubit.getBlocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HarvesterCubit>(
      create: (context) => _harvesterCubit,
      child: BlocListener<HarvesterCubit, HarvesterState>(
          listener: (context, state) {
            if (state is HarvesterDetailLoaded) {
              setState(() {
                _listBlock = state.blocks;
              });
            } else if (state is HarvesterDetailRemoveSuccess) {
              setState(() {
                _listBlock.remove(state.block);
              });
            }
          },
          child:
              _listBlock.isEmpty ? _notFoundBlock() : _listBlocks(_listBlock)),
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
            Strings.emptyBlocks,
            style: AppStyle.body(
                textColor: AppColor.mediumEmphasis, weight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }

  Widget _listBlocks(List<Block> blocks) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: blocks.length,
          itemBuilder: (ctx, index) => _buildBlock(blocks[index], index)),
    );
  }

  Widget _buildBlock(Block block, int index) {
    return Container(
        padding: const EdgeInsets.all(8),
        height: 68,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: AppColor.black200)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      block.blockName,
                      style: AppStyle.headingRegular(),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    block.checker == CheckerModelEnum.tunggal
                        ? Text(
                            Strings.single,
                            style: AppStyle.label(textColor: AppColor.info500),
                          )
                        : Text(
                            Strings.leftRight,
                            style:
                                AppStyle.label(textColor: AppColor.success500),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  block.lineName,
                  style: AppStyle.body(textColor: AppColor.black400),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              child: const Icon(
                Icons.more_vert,
                color: AppColor.highEmphasis,
              ),
              onTap: () {
                _showDialogChooser(block, index);
              },
            )
          ],
        ));
  }

  void refreshList() {
    _harvesterCubit.getBlocks();
  }

  void _showDialogChooser(Block block, int index) {
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(AppColor.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onUpdate(block, index);
                  },
                  child: Text(
                    Strings.update,
                    style:
                        AppStyle.headingRegular(textColor: AppColor.primary500),
                  )),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColor.black500,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(AppColor.white),
                  ),
                  onPressed: () {
                    _harvesterCubit.removeBlock(block);
                    Navigator.pop(context);
                  },
                  child: Text(
                    Strings.delete,
                    style:
                        AppStyle.headingRegular(textColor: AppColor.error500),
                  ))
            ],
          );
        });
  }
}
