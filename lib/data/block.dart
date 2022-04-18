import 'enum/checker_model_enum.dart';

class Block {
  final String blockName;
  final CheckerModelEnum checker;
  final String lineName;

  Block(this.blockName, this.checker, this.lineName);

  Block copyWith(
      {String? blockName, CheckerModelEnum? checker, String? lineName}) {
    return Block(blockName ?? this.blockName, checker ?? this.checker,
        lineName ?? this.lineName);
  }
}
