import 'package:dartz/dartz.dart';
import 'package:marvel_api/characters_module/domain/i_repositories/i_characters_repository.dart';

import '../../../core/error/core_failure.dart';
import '../entities/character_snapshot_entity.dart';

class GetCharactersService {
  final ICharactersRepository _repository;
  GetCharactersService(this._repository);

  Future<Either<CoreFailure, List<CharacterSnapshotEntity>>> call() async => await _repository.getCharacters();
}
