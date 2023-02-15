import '../../../../core/error/exceptions.dart';
import '../character_entity.dart';
import 'character_snapshot_entity_mapper.dart';

class CharacterEntityMapper {
  static CharacterEntity fromJson(Map<String, dynamic> json) {
    try {
      return CharacterEntity(
        snapshot: CharacterSnapshotEntityMapper.fromJson(json),
      );
    } catch (e) {
      throw FromMapParsingException(StackTrace.current, 'CharacterEntityMapper.fromJson', e.toString());
    }
  }
}
