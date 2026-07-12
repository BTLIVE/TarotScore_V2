// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_information_card.dart
//
// Description : Informations générales d'un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_switch_tile.dart';
import '../../../../core/widgets/app_text_field.dart';

import '../../models/rule_profile.dart';

class ProfileInformationCard extends StatefulWidget {
  const ProfileInformationCard({
    super.key,
    required this.profile,
    required this.onChanged,
  });

  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final RuleProfile profile;

  final ValueChanged<RuleProfile> onChanged;

  @override
  State<ProfileInformationCard> createState() =>
      _ProfileInformationCardState();
}

class _ProfileInformationCardState
    extends State<ProfileInformationCard> {
  //---------------------------------------------------------------------------
  // Contrôleurs
  //---------------------------------------------------------------------------

  late final TextEditingController
      _nameController;

  late final TextEditingController
      _descriptionController;

  late final TextEditingController
      _versionController;

  //---------------------------------------------------------------------------
  // Lifecycle
  //---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: widget.profile.name,
    );

    _descriptionController =
        TextEditingController(
      text: widget.profile.description,
    );

    _versionController =
        TextEditingController(
      text: widget.profile.version,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _versionController.dispose();

    super.dispose();
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  void _notify() {
    widget.onChanged(
      widget.profile.copyWith(
        name: _nameController.text,
        description:
            _descriptionController.text,
        version: _versionController.text,
      ),
    );
  }

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          AppTextField(
            controller: _nameController,
            label: 'Nom',
            enabled:
                widget.profile.isEditable,
            onChanged: (_) => _notify(),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          AppTextField(
            controller:
                _descriptionController,
            label: 'Description',
            maxLines: 2,
            enabled:
                widget.profile.isEditable,
            onChanged: (_) => _notify(),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          AppTextField(
            controller:
                _versionController,
            label: 'Version',
            enabled:
                widget.profile.isEditable,
            onChanged: (_) => _notify(),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          AppSwitchTile(
            title: 'Profil actif',
            value: widget.profile.active,
            onChanged:
                widget.profile.isEditable
                    ? (value) {
                        widget.onChanged(
                          widget.profile
                              .copyWith(
                            active: value,
                          ),
                        );
                      }
                    : null,
          ),

          AppSwitchTile(
            title: 'Profil officiel',
            subtitle: 'Lecture seule',
            value:
                widget.profile.official,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}