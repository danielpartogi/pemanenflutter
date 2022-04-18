import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pemanen_flutter/data/block.dart';
import 'package:pemanen_flutter/data/repository/harvester_repository_impl.dart';
import 'package:pemanen_flutter/domain/repository/harvester_repository.dart';

part 'harvester_state.dart';

class HarvesterCubit extends Cubit<HarvesterState> {
  final HarvesterRepository _repository = HarvesterRepositoryImpl();

  HarvesterCubit() : super(HarvesterInitial());

  getBlocks() {
    var blocks = _repository.getListBlock();
    emit(HarvesterDetailLoaded(blocks));
  }

  addBlock(Block block) {
    _repository.createData(block);
    emit(HarvesterDetailAddSuccess(block));
  }

  editBlock(Block block, int index) {
    _repository.updateData(block, index);
    emit(HarvesterDetailUpdateSuccess(block, index));
  }

  removeBlock(Block block) {
    _repository.removeData(block);
    emit(HarvesterDetailRemoveSuccess(block));
  }
}
