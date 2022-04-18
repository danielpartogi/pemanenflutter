part of 'harvester_cubit.dart';

@immutable
abstract class HarvesterState {}

class HarvesterInitial extends HarvesterState {}

class HarvesterDetailLoaded extends HarvesterState {
  final List<Block> blocks;

  HarvesterDetailLoaded(this.blocks);
}

class HarvesterDetailAddSuccess extends HarvesterState {
  final Block block;

  HarvesterDetailAddSuccess(this.block);
}

class HarvesterDetailRemoveSuccess extends HarvesterState {
  final Block block;

  HarvesterDetailRemoveSuccess(this.block);
}

class HarvesterDetailUpdateSuccess extends HarvesterState {
  final Block block;
  final int index;

  HarvesterDetailUpdateSuccess(this.block, this.index);
}
