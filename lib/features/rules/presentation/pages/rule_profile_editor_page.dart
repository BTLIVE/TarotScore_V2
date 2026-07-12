// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_profile_editor_page.dart
//
// Description : Edition d'un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_page.dart';

import '../../models/rule_profile.dart';
import '../../services/rule_profile_service.dart';

import '../widgets/profile_actions_card.dart';
import '../widgets/profile_bonuses_card.dart';
import '../widgets/profile_calculation_card.dart';
import '../widgets/profile_contracts_card.dart';
import '../widgets/profile_information_card.dart';
import '../widgets/profile_penalties_card.dart';

class RuleProfileEditorPage extends StatefulWidget {
  const RuleProfileEditorPage({
    super.key,
    required this.profile,
  });

  final RuleProfile profile;

  @override
  State<RuleProfileEditorPage> createState() =>
      _RuleProfileEditorPageState();
}

class _RuleProfileEditorPageState
    extends State<RuleProfileEditorPage> {
  //---------------------------------------------------------------------------
  // Services
  //---------------------------------------------------------------------------

  final RuleProfileService _service =
      RuleProfileService.instance;

  //---------------------------------------------------------------------------
  // Etat
  //---------------------------------------------------------------------------

  late RuleProfile _profile;

  //---------------------------------------------------------------------------
  // Lifecycle
  //---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _profile = widget.profile;
  }

  //---------------------------------------------------------------------------
  // Actions
  //---------------------------------------------------------------------------

  void _save() {
    _service.save(_profile);

    Navigator.pop(context);
  }

  void _duplicate() {
    _service.duplicate(_profile);

    Navigator.pop(context);
  }

  void _delete() {
    _service.delete(_profile.uuid);

    Navigator.pop(context);
  }

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Profil de règles',
      child: ListView(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        children: [
          //------------------------------------------------------------------
          // Informations
          //------------------------------------------------------------------

          ProfileInformationCard(
            profile: _profile,
            onChanged: (profile) {
              setState(() {
                _profile = profile;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Contrats
          //------------------------------------------------------------------

          ProfileContractsCard(
            profile: _profile,
            onChanged: (profile) {
              setState(() {
                _profile = profile;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Bonus
          //------------------------------------------------------------------

          ProfileBonusesCard(
            profile: _profile,
            onChanged: (profile) {
              setState(() {
                _profile = profile;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Pénalités
          //------------------------------------------------------------------

          ProfilePenaltiesCard(
            profile: _profile,
            onChanged: (profile) {
              setState(() {
                _profile = profile;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Calcul
          //------------------------------------------------------------------

          ProfileCalculationCard(
            profile: _profile,
            onChanged: (profile) {
              setState(() {
                _profile = profile;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          //------------------------------------------------------------------
          // Actions
          //------------------------------------------------------------------

          ProfileActionsCard(
            isEditable: _profile.isEditable,
            isDeletable: _profile.isDeletable,
            onSave: _save,
            onDuplicate: _duplicate,
            onDelete: _delete,
          ),
        ],
      ),
    );
  }
}