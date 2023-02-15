import 'character_snapshot_entity.dart';

class CharacterEntity {
  final CharacterSnapshotEntity snapshot;
  final List<String> comics;
  final List<String> stories;
  final List<String> events;
  final List<String> series;

  CharacterEntity({
    required this.snapshot,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });
}
