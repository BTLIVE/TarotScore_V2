import 'package:flutter/material.dart';

import '../services/avatar_service.dart';
import '../widgets/avatar_section.dart';
import '../widgets/avatar_view.dart';

class AvatarPickerScreen extends StatefulWidget {
  const AvatarPickerScreen({
    super.key,
    required this.selectedAvatar,
  });

  final String selectedAvatar;

  @override
  State<AvatarPickerScreen> createState() => _AvatarPickerScreenState();
}

class _AvatarPickerScreenState extends State<AvatarPickerScreen> {
  final AvatarService _service = AvatarService.instance;

  late String _selectedAvatar;

  @override
  void initState() {
    super.initState();
    _selectedAvatar = widget.selectedAvatar;
  }

  void _select(String avatarId) {
    // Un simple clic suffit
    Navigator.pop(context, avatarId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir un avatar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: AvatarView(
              avatarId: _selectedAvatar,
              radius: 48,
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Text(
              _selectedAvatar,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          const SizedBox(height: 32),

          AvatarSection(
            title: '👨 Avatars masculins',
            avatars: _service.maleAvatars,
            selectedAvatar: _selectedAvatar,
            onSelected: _select,
          ),

          AvatarSection(
            title: '👩 Avatars féminins',
            avatars: _service.femaleAvatars,
            selectedAvatar: _selectedAvatar,
            onSelected: _select,
          ),
        ],
      ),
    );
  }
}