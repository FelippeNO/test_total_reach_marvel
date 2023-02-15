import 'package:dartz/dartz.dart';
import 'package:marvel_api/characters_module/domain/i_repositories/i_characters_repository.dart';

import '../../../core/error/core_failure.dart';
import '../entities/character_entity.dart';

class GetCharacterByIdService {
  final ICharactersRepository _repository;
  GetCharacterByIdService(this._repository);

  Future<Either<CoreFailure, CharacterEntity>> call(int characterId) async =>
      await _repository.getCharacterById(characterId: characterId);
}
