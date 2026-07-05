import 'package:flutter/material.dart';

import '../models/player.dart';
import '../services/player_service.dart';
import '../validators/player_validator.dart';

import 'cards/player_avatar_card.dart';
import 'cards/player_contact_card.dart';
import 'cards/player_identity_card.dart';
import 'cards/player_information_card.dart';

class PlayerForm extends StatefulWidget {
  const PlayerForm({
    super.key,
    this.player,
  });

  final Player? player;

  @override
  State<PlayerForm> createState() => PlayerFormState();
}

class PlayerFormState extends State<PlayerForm> {
  final _formKey = GlobalKey<FormState>();

  final PlayerService _service = PlayerService.instance;

  //----------------------------------------------------------------------------
  // Contrôleurs
  //----------------------------------------------------------------------------

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();

  final TextEditingController _commentsController = TextEditingController();

  DateTime? _birthDate;
  bool _active = true;

  //----------------------------------------------------------------------------
  // Cycle de vie
  //----------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    if (widget.player != null) {
      _loadPlayer(widget.player!);
    }
  }

  @override
  void dispose() {
    _lastNameController.dispose();
    _firstNameController.dispose();
    _nicknameController.dispose();

    _emailController.dispose();
    _mobilePhoneController.dispose();

    _commentsController.dispose();

    super.dispose();
  }

  //----------------------------------------------------------------------------
  // Chargement d'un joueur
  //----------------------------------------------------------------------------

  void _loadPlayer(Player player) {
    _lastNameController.text = player.lastName;
    _firstNameController.text = player.firstName;
    _nicknameController.text = player.nickname ?? '';

    _emailController.text = player.email ?? '';
    _mobilePhoneController.text = player.mobilePhone ?? '';

    _commentsController.text = player.comments ?? '';

    _birthDate = player.birthDate;
    _active = player.active;
  }

  //----------------------------------------------------------------------------
  // Sauvegarde
  //----------------------------------------------------------------------------

  Future<bool> save() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    if (widget.player == null) {
      await _service.create(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        nickname: _nicknameController.text,
        email: _emailController.text,
        mobilePhone: _mobilePhoneController.text,
        birthDate: _birthDate,
        comments: _commentsController.text,
        active: _active,
      );
    } else {
      final player = widget.player!
        ..firstName = _firstNameController.text
        ..lastName = _lastNameController.text
        ..nickname = _nicknameController.text
        ..email = _emailController.text
        ..mobilePhone = _mobilePhoneController.text
        ..birthDate = _birthDate
        ..comments = _commentsController.text
        ..active = _active;

      await _service.update(player);
    }

    return true;
  }

  //----------------------------------------------------------------------------
  // Interface
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PlayerIdentityCard(
            lastNameController: _lastNameController,
            firstNameController: _firstNameController,
            nicknameController: _nicknameController,
            active: _active,
            onActiveChanged: (value) {
              setState(() {
                _active = value;
              });
            },
            lastNameValidator: PlayerValidator.validateLastName,
            firstNameValidator: PlayerValidator.validateFirstName,
          ),

          const SizedBox(height: 16),

          PlayerContactCard(
            emailController: _emailController,
            mobilePhoneController: _mobilePhoneController,
            emailValidator: PlayerValidator.validateEmail,
            mobilePhoneValidator: PlayerValidator.validateMobilePhone,
          ),

          const SizedBox(height: 16),

          PlayerInformationCard(
            birthDate: _birthDate,
            commentsController: _commentsController,
            onBirthDatePressed: _selectBirthDate,
          ),

          const SizedBox(height: 16),

          PlayerAvatarCard(
            onAvatarPressed: _selectAvatar,
            onPhotoPressed: _selectPhoto,
          ),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Actions
  //----------------------------------------------------------------------------

  Future<void> _selectBirthDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        _birthDate = date;
      });
    }
  }

  void _selectAvatar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sélection d\'avatar à venir'),
      ),
    );
  }

  void _selectPhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sélection de photo à venir'),
      ),
    );
  }
}