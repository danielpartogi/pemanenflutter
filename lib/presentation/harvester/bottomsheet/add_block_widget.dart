import 'package:flutter/material.dart';
import 'package:pemanen_flutter/core/assets/color.dart';
import 'package:pemanen_flutter/core/assets/style.dart';
import 'package:pemanen_flutter/data/checker_model_enum.dart';
import 'package:pemanen_flutter/presentation/harvester/choose_block_widget.dart';
import 'package:pemanen_flutter/presentation/harvester/choose_line_widget.dart';

class AddBlockWidget extends StatefulWidget {
  const AddBlockWidget({Key? key}) : super(key: key);

  @override
  State<AddBlockWidget> createState() => _AddBlockWidgetState();
}

class _AddBlockWidgetState extends State<AddBlockWidget> {

  final PageController controller = PageController();
  int _selectedLine = 25;
  CheckerModelEnum _checkerModelEnum = CheckerModelEnum.tunggal;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 32),
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          )),
      child: Wrap(
        alignment: WrapAlignment.center,
          children: [_buildLine(), const SizedBox(height: 12,), _buildHeader(), _buildBody()],

      ),
    );
  }

  _buildBody() {
    return Container(
      margin:  const EdgeInsets.only(top: 32) ,
      height: 320,
      child: PageView(
        onPageChanged: (value){
          setState(() {
            currentPage = value +1;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children:  <Widget>[
          ChooseBlockWidget(onSelectBlock: (indexBlock){
            controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.ease);
          },),
          ChooseLineWidget(
            selectedLine: _selectedLine,
            onSelectLine: (value) {
              setState(() {
                _selectedLine = value;
              });
            },
            onBack: (){controller.previousPage(duration: Duration(milliseconds: 200), curve: Curves.ease);},
            onCreate: (){},
            checker: _checkerModelEnum,
            onChangeChecker: (value) {
              setState(() {
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
            Text(currentPage == 1 ? "Pilih Block" : "Pilih Baris", style: AppStyle.headingMedium(),),
            const SizedBox(height: 4,),
            Text("Langkah $currentPage dari 2", style: AppStyle.label(textColor: AppColor.primary500),)
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child:  const Icon(Icons.close,color: AppColor.mediumEmphasis,))
      ],
    );
  }
}
