import '../character_snapshot_entity.dart';

class CharacterSnapshotEntityMapper {
  static CharacterSnapshotEntity fromJson(Map<String, dynamic> json) {
    return CharacterSnapshotEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnailUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }
}
