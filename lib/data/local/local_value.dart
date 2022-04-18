import '../block.dart';

class LocalValue {
  static List<Block>? blocks;

  static clearData() {
    blocks = null;
  }

  static addData(Block block) {
    if(blocks == null) {
      blocks = [block];
    } else {
      blocks?.add(block);
    }
  }

  static removeData(Block block) {
    blocks?.remove(block);
  }

  static updateData(Block block, int index) {
    blocks?[index] = block;
  }
}
