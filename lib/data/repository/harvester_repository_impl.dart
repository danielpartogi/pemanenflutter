
import 'package:pemanen_flutter/data/block.dart';
import 'package:pemanen_flutter/data/local/local_value.dart';
import 'package:pemanen_flutter/domain/repository/harvester_repository.dart';

class HarvesterRepositoryImpl extends HarvesterRepository {



  HarvesterRepositoryImpl();

  @override
  createData(Block block) {
    LocalValue.addData(block);
  }

  @override
  List<Block> getListBlock() {
   return LocalValue.blocks ?? [];
  }

  @override
  removeData(Block block) {
    LocalValue.removeData(block);
  }

  @override
  updateData(Block block, int index) {
    LocalValue.updateData(block, index);
  }
}