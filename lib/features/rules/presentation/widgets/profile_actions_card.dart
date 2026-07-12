// ***************************************************************************
//
// TarotScore V2
//
// Fichier : profile_actions_card.dart
//
// Description : Actions disponibles sur un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';

class ProfileActionsCard extends StatelessWidget {
  const ProfileActionsCard({
    super.key,
    required this.isEditable,
    required this.isDeletable,
    required this.onSave,
    required this.onDuplicate,
    required this.onDelete,
  });

  //---------------------------------------------------------------------------
  // Paramètres
  //---------------------------------------------------------------------------

  final bool isEditable;

  final bool isDeletable;

  final VoidCallback? onSave;

  final VoidCallback? onDuplicate;

  final VoidCallback? onDelete;

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          AppButton(
            label: 'Enregistrer',
            onPressed:
                isEditable ? onSave : null,
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          AppButton(
            label: 'Dupliquer',
            onPressed: onDuplicate,
          ),

          if (isDeletable) ...[
            const SizedBox(
              height: AppSpacing.md,
            ),

            AppButton(
              label: 'Supprimer',
              onPressed: onDelete,
            ),
          ],
        ],
      ),
    );
  }
}