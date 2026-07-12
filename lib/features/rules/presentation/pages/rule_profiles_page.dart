// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_profiles_page.dart
//
// Description : Gestion des profils de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_page.dart';
import '../../../../core/widgets/app_section.dart';

import '../../models/rule_profile.dart';
import '../../services/rule_profile_service.dart';
import 'rule_profile_editor_page.dart';

class RuleProfilesPage extends StatefulWidget {
  const RuleProfilesPage({
    super.key,
  });

  @override
  State<RuleProfilesPage> createState() =>
      _RuleProfilesPageState();
}

class _RuleProfilesPageState
    extends State<RuleProfilesPage> {
  //---------------------------------------------------------------------------
  // Services
  //---------------------------------------------------------------------------

  final RuleProfileService _service =
      RuleProfileService.instance;

  //---------------------------------------------------------------------------
  // Etat
  //---------------------------------------------------------------------------

  late List<RuleProfile> _profiles;

  //---------------------------------------------------------------------------
  // Lifecycle
  //---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _reloadProfiles();
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  void _reloadProfiles() {
    _profiles = _service.getAll();
  }

  Future<void> _createProfile() async {
    final profile = _service.create();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            RuleProfileEditorPage(
          profile: profile,
        ),
      ),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _reloadProfiles();
    });
  }

  Future<void> _editProfile(
    RuleProfile profile,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            RuleProfileEditorPage(
          profile: profile,
        ),
      ),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _reloadProfiles();
    });
  }

  //---------------------------------------------------------------------------
  // UI
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Profils de règles',
      child: ListView(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        children: [
          AppSection(
            title: 'Profils disponibles',
            child: AppCard(
              child: _profiles.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(
                        AppSpacing.md,
                      ),
                      child: Text(
                        'Aucun profil disponible.',
                      ),
                    )
                  : Column(
                      children: List.generate(
                        _profiles.length,
                        (index) {
                          final profile =
                              _profiles[index];

                          return Column(
                            children: [
                              if (index > 0)
                                const Divider(
                                  height: 1,
                                ),

                              ListTile(
                                leading: const Icon(
                                  Icons.rule,
                                ),

                                title: Text(
                                  profile.displayName,
                                ),

                                subtitle: Text(
                                  profile.summary,
                                ),

                                trailing:
                                    const Icon(
                                  Icons.chevron_right,
                                ),

                                onTap: () =>
                                    _editProfile(
                                  profile,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ),
          ),

          const SizedBox(
            height: AppSpacing.xl,
          ),

          AppButton(
            label: 'Nouveau profil',
            onPressed: _createProfile,
          ),
        ],
      ),
    );
  }
}