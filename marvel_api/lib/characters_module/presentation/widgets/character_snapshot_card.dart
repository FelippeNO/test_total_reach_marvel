import 'package:flutter/material.dart';

import '../../../core/design/ui/ui_scale.dart';
import '../../../core/navigation/core_navigator.dart';
import '../../domain/entities/character_snapshot_entity.dart';

class CharacterSnapshotCard extends StatefulWidget {
  const CharacterSnapshotCard({Key? key, required this.characterSnapshot}) : super(key: key);
  final CharacterSnapshotEntity characterSnapshot;

  @override
  State<CharacterSnapshotCard> createState() => _CharacterSnapshotCardState();
}

class _CharacterSnapshotCardState extends State<CharacterSnapshotCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => CoreNavigator.characters.goToCharacterView(widget.characterSnapshot.id),
        child: Container(
          height: UIScale.height(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: UIScale.width(22),
                height: UIScale.height(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(widget.characterSnapshot.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.characterSnapshot.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.characterSnapshot.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
