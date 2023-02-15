import 'package:marvel_api/core/error/core_failure.dart';

import 'package:marvel_api/characters_module/domain/entities/character_snapshot_entity.dart';

import 'package:marvel_api/characters_module/domain/entities/character_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/i_repositories/i_characters_repository.dart';
import '../../error/exceptions.dart';
import '../../error/failures.dart';
import '../gateways/characters_gateway.dart';

class CharactersRepository implements ICharactersRepository {
  final ICharactersGateway _gateway;

  CharactersRepository(this._gateway);

  @override
  Future<Either<CoreFailure, CharacterEntity>> getCharacterById({required String characterId}) {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }

  @override
  Future<Either<CoreFailure, List<CharacterSnapshotEntity>>> getCharacters() async {
    try {
      final List<CharacterSnapshotEntity> result = await _gateway.getCharacters();
      return Right(result);
    } on GetCharactersException {
      return Left(GetCharactersFailure());
    } on Exception {
      return Left(GetCharactersFailure());
    }
  }
}
