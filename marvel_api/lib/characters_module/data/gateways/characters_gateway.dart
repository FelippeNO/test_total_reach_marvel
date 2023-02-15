import 'package:dio/dio.dart';
import 'package:marvel_api/characters_module/domain/entities/character_snapshot_entity.dart';
import 'package:marvel_api/environment_config.dart';

import '../../../core/api/core_http_client.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/entities/mappers/character_snapshot_entity_mapper.dart';
import '../../error/exceptions.dart';

abstract class ICharactersGateway {
  Future<List<CharacterSnapshotEntity>> getCharacters();
  Future<CharacterEntity> getCharacterById({required String characterId});
}

class CharactersGateway implements ICharactersGateway {
  final CoreHttpClient _httpClient;

  CharactersGateway(this._httpClient);

  @override
  Future<CharacterEntity> getCharacterById({required String characterId}) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterSnapshotEntity>> getCharacters() async {
    try {
      final Response result =
          await _httpClient.get("characters", queryParameters: EnvironmentConfig.getBaseParameters());
      if (result.statusCode == 200) {
        final results = result.data['data']['results'] as List;
        return results.map((e) => CharacterSnapshotEntityMapper.fromJson(e)).toList();
      }
      return throw GetCharactersException(StackTrace.current, 'CharactersGateway.getCharacters', result);
    } catch (e) {
      throw GetCharactersException(StackTrace.current, 'CharactersGateway.getCharacters', '');
    }
  }
}
