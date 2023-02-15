import 'character_snapshot_entity.dart';

class CharacterEntity extends CharacterSnapshotEntity {
  final String lol;

  CharacterEntity({
    required super.id,
    required super.name,
    required super.description,
    required super.thumbnailUrl,
    required this.lol,
  });
}
