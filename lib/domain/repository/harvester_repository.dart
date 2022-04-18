
import 'package:pemanen_flutter/data/block.dart';

abstract class HarvesterRepository {
   createData(Block block);
   removeData(Block block);
   updateData(Block block, int index);
   List<Block> getListBlock();
}