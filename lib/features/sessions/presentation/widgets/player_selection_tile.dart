import 'package:flutter/material.dart';

import '../../../players/models/player.dart';
import '../../../../core/widgets/app_list_tile.dart';

class PlayerSelectionTile extends StatelessWidget {
  final Player player;
  final bool selected;
  final ValueChanged<bool> onChanged;

  const PlayerSelectionTile({
    super.key,
    required this.player,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      leading: Checkbox(
        value: selected,
        onChanged: (value) {
          onChanged(value ?? false);
        },
      ),
      title: Text(
        '${player.firstName} ${player.lastName}',
      ),
      onTap: () {
        onChanged(!selected);
      },
    );
  }
}