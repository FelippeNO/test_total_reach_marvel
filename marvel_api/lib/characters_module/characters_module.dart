import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/characters_module/data/gateways/characters_gateway.dart';
import 'package:marvel_api/characters_module/domain/services/get_characters_service.dart';
import 'package:marvel_api/characters_module/presentation/controllers/characters_view_controller.dart';
import 'package:marvel_api/characters_module/presentation/views/characters_view.dart';

import '../core/api/core_http_client.dart';
import 'data/repositories/characters_repository.dart';

class CharactersModule extends Module {
  @override
  final List<Bind> binds = [
    /// ------------------------------ Clients --------------------------------
    Bind.lazySingleton((i) => CoreHttpClient(), export: true),

    /// ------------------------------ Gateways --------------------------------
    Bind.lazySingleton((i) => CharactersGateway(i()), export: true),

    /// ---------------------------- Repositories ------------------------------
    Bind.lazySingleton((i) => CharactersRepository(i()), export: true),

    /// ------------------------------ Services --------------------------------
    Bind.lazySingleton((i) => GetCharactersService(i()), export: true),

    /// ------------------------------- State ---------------------------------
    Bind.lazySingleton((i) => CharactersViewController(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CharactersView()),
  ];
}
