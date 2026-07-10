// ***************************************************************************
//
// TarotScore V2
//
// Fichier : deal_form_page.dart
//
// Description : Saisie d'une nouvelle donne.
//
// Auteur : David
//
// ***************************************************************************

import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_page.dart';

import '../../../players/models/player.dart';
import '../../../rules/engine/models/deal_event.dart';
import '../../../rules/engine/pipeline/deal_calculation.dart';

import '../../services/deal_factory.dart';
import '../../services/session_play_service.dart';
import '../../services/session_service.dart';

import '../dialogs/deal_result_dialog.dart';
import '../widgets/deal/deal_bonus_card.dart';
import '../widgets/deal/deal_contract_card.dart';
import '../widgets/deal/deal_players_card.dart';
import '../widgets/deal/deal_points_card.dart';

class DealFormPage extends StatefulWidget {
  const DealFormPage({
    super.key,
  });

  @override
  State<DealFormPage> createState() =>
      _DealFormPageState();
}

class _DealFormPageState
    extends State<DealFormPage> {
  //--------------------------------------------------------------------------
  // Etat du formulaire
  //--------------------------------------------------------------------------

  int? _takerPosition;

  int? _partnerPosition;

  String? _contractId;

  int _oudlers = 0;

  final TextEditingController _pointsController =
      TextEditingController();

  Set<String> _selectedBonusIds = {};

  //--------------------------------------------------------------------------
  // Lifecycle
  //--------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _pointsController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pointsController.dispose();
    super.dispose();
  }

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  bool get _isValid {
    return _takerPosition != null &&
        _contractId != null &&
        _pointsController.text.trim().isNotEmpty;
  }

  //--------------------------------------------------------------------------
  // Validation de la donne
  //--------------------------------------------------------------------------

  Future<void> _validateDeal() async {
    final state =
        SessionService.instance
            .requireCurrentSession();

    final points = double.tryParse(
      _pointsController.text
          .trim()
          .replaceAll(',', '.'),
    );

    if (points == null ||
        _takerPosition == null ||
        _contractId == null) {
      return;
    }

    final events = _selectedBonusIds
        .map(
          (id) => DealEvent(
            id: id,
          ),
        )
        .toList(growable: false);

    final deal =
        DealFactory.instance.create(
      state: state,
      attackerPosition:
          _takerPosition!,
      partnerPosition:
          _partnerPosition,
      contractId: _contractId!,
      oudlers: _oudlers,
      points: points,
      events: events,
    );

    try {
      //----------------------------------------------------------------------
      // Prévisualisation
      //----------------------------------------------------------------------

      final DealCalculation calculation =
          SessionPlayService.instance
              .previewDeal(
        deal: deal,
      );

      if (!mounted) {
        return;
      }

      final confirmed =
          await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (_) =>
            DealResultDialog(
          calculation: calculation,
          players: state.activePlayers,
        ),
      );

      if (confirmed != true) {
        return;
      }

      //----------------------------------------------------------------------
      // Validation définitive
      //----------------------------------------------------------------------

      SessionPlayService.instance
          .playDeal(
        deal: deal,
      );

      if (!mounted) {
        return;
      }

      Navigator.pop(
        context,
        true,
      );
    } catch (e) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  //--------------------------------------------------------------------------
  // UI
  //--------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final state =
        SessionService.instance
            .requireCurrentSession();

    final session = state.session;

    /// Seulement les joueurs actifs de la donne.
    final List<Player> players =
        state.activePlayers;

    return AppPage(
      title: 'Nouvelle donne',
      child: ListView(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        children: [
          DealPlayersCard(
            players: players,
            playerPositions:
                state.activePlayerPositions,
            takerPosition:
                _takerPosition,
            partnerPosition:
                _partnerPosition,
            onTakerChanged:
                (position) {
              setState(() {
                _takerPosition =
                    position;

                if (_partnerPosition ==
                    position) {
                  _partnerPosition =
                      null;
                }
              });
            },
            onPartnerChanged:
                (position) {
              setState(() {
                _partnerPosition =
                    position;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          DealContractCard(
            contracts:
                session.ruleProfile
                    .enabledContracts,
            selectedContractId:
                _contractId,
            onChanged:
                (contractId) {
              setState(() {
                _contractId =
                    contractId;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          DealPointsCard(
            oudlers: _oudlers,
            pointsController:
                _pointsController,
            onOudlersChanged:
                (value) {
              setState(() {
                _oudlers = value;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          DealBonusCard(
            bonuses:
                session.ruleProfile
                    .enabledBonuses,
            selectedBonusIds:
                _selectedBonusIds,
            onChanged:
                (values) {
              setState(() {
                _selectedBonusIds =
                    values;
              });
            },
          ),

          const SizedBox(
            height: AppSpacing.xl,
          ),

          AppButton(
            label:
                'Valider la donne',
            onPressed:
                _isValid
                    ? _validateDeal
                    : null,
          ),
        ],
      ),
    );
  }
}