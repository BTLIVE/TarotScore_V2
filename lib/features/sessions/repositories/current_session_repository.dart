// ***************************************************************************
//
// TarotScore V2
//
// Fichier : current_session_repository.dart
//
// Description : Sauvegarde de la partie en cours.
//
// Une seule partie peut être en cours.
// Elle est sauvegardée automatiquement au format JSON.
//
// Auteur : David
//
// ***************************************************************************

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../models/session_state.dart';
import '../serialization/session_state_serializer.dart';

class CurrentSessionRepository {
  CurrentSessionRepository._();

  static final CurrentSessionRepository instance =
      CurrentSessionRepository._();

  static const String _directoryName =
      'json';

  static const String _fileName =
      'current_session.json';

  //--------------------------------------------------------------------------
  // Fichier de sauvegarde
  //--------------------------------------------------------------------------

  Future<File> _getFile() async {
    final documents =
        await getApplicationDocumentsDirectory();

    final directory = Directory(
      '${documents.path}/$_directoryName',
    );

    if (!await directory.exists()) {
      await directory.create(
        recursive: true,
      );

      debugPrint(
        'JSON directory created : ${directory.path}',
      );
    }

    return File(
      '${directory.path}/$_fileName',
    );
  }

  //--------------------------------------------------------------------------
  // Sauvegarde
  //--------------------------------------------------------------------------

  Future<void> save(
    SessionState state,
  ) async {
    try {
      debugPrint(
        '========== SAVE CURRENT SESSION =========='
      );

      final file = await _getFile();

      debugPrint(
        'File : ${file.path}',
      );

      final json = jsonEncode(
        SessionStateSerializer.toJson(
          state,
        ),
      );

      debugPrint(
        'JSON size : ${json.length}',
      );

      await file.writeAsString(
        json,
        flush: true,
      );

      debugPrint(
        'SAVE OK'
      );
    } catch (e, stack) {
      debugPrint(
        'SAVE ERROR : $e',
      );

      debugPrint(
        stack.toString(),
      );
    }
  }

  //--------------------------------------------------------------------------
  // Chargement
  //--------------------------------------------------------------------------

  Future<SessionState?> load() async {
    try {
      debugPrint(
        '========== LOAD CURRENT SESSION =========='
      );

      final file = await _getFile();

      debugPrint(
        'File : ${file.path}',
      );

      if (!await file.exists()) {
        debugPrint(
          'No current session file.'
        );

        return null;
      }

      debugPrint(
        'File found.'
      );

      final json =
          await file.readAsString();

      debugPrint(
        'JSON size : ${json.length}',
      );

      final map =
          jsonDecode(json)
              as Map<String, dynamic>;

      final state =
          SessionStateSerializer.fromJson(
        map,
      );

      debugPrint(
        'LOAD OK'
      );

      return state;
    } catch (e, stack) {
      debugPrint(
        'LOAD ERROR : $e',
      );

      debugPrint(
        stack.toString(),
      );

      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Existence
  //--------------------------------------------------------------------------

  Future<bool> exists() async {
    final file = await _getFile();

    final exists =
        await file.exists();

    debugPrint(
      'Current session exists : $exists',
    );

    return exists;
  }

  //--------------------------------------------------------------------------
  // Suppression
  //--------------------------------------------------------------------------

  Future<void> delete() async {
    try {
      final file = await _getFile();

      if (await file.exists()) {
        await file.delete();

        debugPrint(
          'Current session deleted.',
        );
      }
    } catch (e) {
      debugPrint(
        'DELETE ERROR : $e',
      );
    }
  }
}