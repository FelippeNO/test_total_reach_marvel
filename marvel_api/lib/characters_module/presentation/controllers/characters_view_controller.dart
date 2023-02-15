import 'package:flutter/cupertino.dart';
import 'package:marvel_api/characters_module/domain/entities/character_snapshot_entity.dart';

import '../../../core/utils/my_controller.dart';
import '../../domain/services/get_characters_service.dart';

enum CharactersViewState { loading, success, error }

class CharactersViewController extends MyController {
  final GetCharactersService _getCharactersService;

  CharactersViewController(
    this._getCharactersService,
  );

  final ValueNotifier<CharactersViewState> _state = ValueNotifier(CharactersViewState.loading);
  final List<CharacterSnapshotEntity> _characters = [];

  ValueNotifier<CharactersViewState> get state => _state;
  List<CharacterSnapshotEntity> get characters => _characters;

  Future<void> initialize() async => _getCharacters();

  _getCharacters() async {
    setValueNotifier(_state, CharactersViewState.loading);
    final request = await _getCharactersService.call();
    request.fold((l) => setValueNotifier(_state, CharactersViewState.error), (r) => _handlingCharacters(r));
  }

  void _handlingCharacters(r) {
    _characters
      ..clear()
      ..addAll(r);
    setValueNotifier(_state, CharactersViewState.success);
  }
}
