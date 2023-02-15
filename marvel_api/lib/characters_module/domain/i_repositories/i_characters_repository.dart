import 'package:dartz/dartz.dart';

import '../../../core/error/core_failure.dart';
import '../entities/character_entity.dart';
import '../entities/character_snapshot_entity.dart';

abstract class ICharactersRepository {
  Future<Either<CoreFailure, List<CharacterSnapshotEntity>>> getCharacters();
  Future<Either<CoreFailure, CharacterEntity>> getCharacterById({required String characterId});
}
