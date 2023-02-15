import '../../../../core/error/exceptions.dart';
import '../character_snapshot_entity.dart';

class CharacterSnapshotEntityMapper {
  static CharacterSnapshotEntity fromJson(Map<String, dynamic> json) {
    try {
      return CharacterSnapshotEntity(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnailUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      );
    } catch (e) {
      throw FromMapParsingException(StackTrace.current, 'CharacterSnapshotEntityMapper.fromJson', e.toString());
    }
  }
}
