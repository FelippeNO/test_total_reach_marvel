import '../../../../core/error/exceptions.dart';
import '../character_entity.dart';
import 'character_snapshot_entity_mapper.dart';

class CharacterEntityMapper {
  static CharacterEntity fromJson(Map<String, dynamic> json) {
    try {
      return CharacterEntity(
        snapshot: CharacterSnapshotEntityMapper.fromJson(json),
        comics: (json['comics']['items'] as List).map((e) => e['name'] as String).toList(),
        stories: (json['stories']['items'] as List).map((e) => e['name'] as String).toList(),
        events: (json['events']['items'] as List).map((e) => e['name'] as String).toList(),
        series: (json['series']['items'] as List).map((e) => e['name'] as String).toList(),
      );
    } catch (e) {
      throw FromMapParsingException(StackTrace.current, 'CharacterEntityMapper.fromJson', e.toString());
    }
  }
}
