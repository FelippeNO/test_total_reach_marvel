import 'package:flutter/cupertino.dart';
import 'package:marvel_api/characters_module/domain/entities/character_snapshot_entity.dart';

import '../../domain/services/get_characters_service.dart';

enum CharactersViewState { loading, success, error }

class CharactersViewController extends ChangeNotifier {
  final GetCharactersService _getCharactersService;

  CharactersViewController(
    this._getCharactersService,
  );

  final ValueNotifier<CharactersViewState> _state = ValueNotifier(CharactersViewState.loading);
  final List<CharacterSnapshotEntity> _characters = [];

  ValueNotifier<CharactersViewState> get state => _state;
  List<CharacterSnapshotEntity> get characters => _characters;

  Future<void> initialize() async {
    _getCharacters();
  }

  _getCharacters() async {
    _state.value = CharactersViewState.loading;
    _state.notifyListeners();
    final request = await _getCharactersService.call();
    request.fold((l) {
      _state.value = CharactersViewState.error;
      _state.notifyListeners();
    }, (r) {
      _characters.clear();
      _characters.addAll(r);
      _state.value = CharactersViewState.success;
      _state.notifyListeners();
    });
  }
}
