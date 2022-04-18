import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/strings.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/data/block.dart';
import 'package:pemanen_flutter/data/enum/checker_model_enum.dart';
import 'package:pemanen_flutter/presentation/harvester/bottomsheet/choose_block_widget.dart';
import 'package:pemanen_flutter/presentation/harvester/bottomsheet/choose_line_widget.dart';
import 'package:pemanen_flutter/presentation/harvester/state/harvester_cubit.dart';

class AddBlockWidget extends StatefulWidget {
  final Block? block;
  final int? index;

  const AddBlockWidget({Key? key, this.block, this.index}) : super(key: key);

  @override
  State<AddBlockWidget> createState() => _AddBlockWidgetState();
}

class _AddBlockWidgetState extends State<AddBlockWidget> {
  final PageController controller = PageController();
  final HarvesterCubit _harvesterCubit = HarvesterCubit();
  int _selectedLine = 25;
  CheckerModelEnum _checkerModelEnum = CheckerModelEnum.tunggal;
  int currentPage = 1;
  Block? _selectedBlock;

  @override
  void initState() {
    _selectedBlock = widget.block ??
        Block("", CheckerModelEnum.tunggal, "${Strings.line} $_selectedLine");
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _harvesterCubit,
      child: BlocListener<HarvesterCubit, HarvesterState>(
        listener: (context, state) {
          if (state is HarvesterDetailAddSuccess) {
            Navigator.pop(context);
          }else if (state is HarvesterDetailUpdateSuccess) {
            Navigator.pop(context);
          }
        },
        child: Container(
          padding:
              const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 32),
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              )),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              _buildLine(),
              const SizedBox(
                height: 12,
              ),
              _buildHeader(),
              _buildBody()
            ],
          ),
        ),
      ),
    );
  }

  _buildBody() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 320,
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            currentPage = value + 1;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          ChooseBlockWidget(
            onSelectBlock: (indexBlock) {
              _selectedBlock =
                  _selectedBlock?.copyWith(blockName: "${Strings.block} : A$indexBlock");
              controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
            },
          ),
          ChooseLineWidget(
            selectedLine: _selectedLine,
            isUpdate: widget.block != null,
            onSelectLine: (value) {
              setState(() {
                var lineValue = _checkerModelEnum == CheckerModelEnum.kananKiri
                    ? "${Strings.line} $value, ${Strings.line} ${value + 1}"
                    : "${Strings.line} $value";
                _selectedBlock = _selectedBlock?.copyWith(lineName: lineValue);
                _selectedLine = value;
              });
            },
            onBack: () {
              controller.previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
            },
            onCreate: () {
              if (_selectedBlock != null) {
                if (widget.block == null) {
                  _harvesterCubit.addBlock(_selectedBlock!);
                } else if(widget.index != null) {
                  _harvesterCubit.editBlock(_selectedBlock!, widget.index!);
                }
              }
            },
            checker: _checkerModelEnum,
            onChangeChecker: (value) {
              setState(() {
                var lineValue = value == CheckerModelEnum.kananKiri
                    ? "${Strings.line} $_selectedLine, ${Strings.line} ${_selectedLine + 1}"
                    : "${Strings.line} $_selectedLine";
                _selectedBlock = _selectedBlock?.copyWith(
                    checker: value, lineName: lineValue);
                _checkerModelEnum = value;
              });
            },
          )
        ],
      ),
    );
  }

  _buildLine() {
    return Container(
      width: 84,
      height: 8,
      decoration: const BoxDecoration(
          color: AppColor.black100,
          borderRadius: BorderRadius.all(Radius.circular(4))),
    );
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentPage == 1 ? "Pilih ${Strings.block}" : "Pilih ${Strings.line}",
              style: AppStyle.headingMedium(),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Langkah $currentPage dari 2",
              style: AppStyle.label(textColor: AppColor.primary500),
            )
          ],
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColor.mediumEmphasis,
            ))
      ],
    );
  }
}
