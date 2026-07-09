// ***************************************************************************
//
// TarotScore V2
//
// Fichier : player_serializer.dart
//
// Description : Sérialisation JSON des joueurs.
//
// Auteur : David
//
// ***************************************************************************

import '../models/player.dart';

class PlayerSerializer {
  PlayerSerializer._();

  //--------------------------------------------------------------------------
  // Vers JSON
  //--------------------------------------------------------------------------

  static Map<String, dynamic> toJson(
    Player player,
  ) {
    return {
      'id': player.id,

      'uuid': player.uuid,

      'first_name': player.firstName,

      'last_name': player.lastName,

      'nickname': player.nickname,

      'email': player.email,

      'mobile_phone': player.mobilePhone,

      'birth_date':
          player.birthDate?.toIso8601String(),

      'comments': player.comments,

      'avatar_id': player.avatarId,

      'photo_file_name':
          player.photoFileName,

      'active': player.active,

      'created_at':
          player.createdAt.toIso8601String(),

      'updated_at':
          player.updatedAt.toIso8601String(),
    };
  }

  //--------------------------------------------------------------------------
  // Depuis JSON
  //--------------------------------------------------------------------------

  static Player fromJson(
    Map<String, dynamic> json,
  ) {
    return Player(
      id: json['id'] as int?,

      uuid:
          json['uuid'] as String,

      firstName:
          json['first_name'] as String,

      lastName:
          json['last_name'] as String,

      nickname:
          json['nickname'] as String?,

      email:
          json['email'] as String?,

      mobilePhone:
          json['mobile_phone'] as String?,

      birthDate:
          json['birth_date'] == null
              ? null
              : DateTime.parse(
                  json['birth_date']
                      as String,
                ),

      comments:
          json['comments'] as String?,

      avatarId:
          (json['avatar_id'] as String?) ??
              'male_01',

      photoFileName:
          json['photo_file_name']
              as String?,

      active:
          json['active'] as bool,

      createdAt:
          DateTime.parse(
        json['created_at'] as String,
      ),

      updatedAt:
          DateTime.parse(
        json['updated_at'] as String,
      ),
    );
  }

  //--------------------------------------------------------------------------
  // Liste vers JSON
  //--------------------------------------------------------------------------

  static List<Map<String, dynamic>>
      toJsonList(
    List<Player> players,
  ) {
    return players
        .map(toJson)
        .toList(
          growable: false,
        );
  }

  //--------------------------------------------------------------------------
  // Liste depuis JSON
  //--------------------------------------------------------------------------

  static List<Player>
      fromJsonList(
    List<dynamic> json,
  ) {
    return json
        .map(
          (item) => fromJson(
            item
                as Map<String, dynamic>,
          ),
        )
        .toList(
          growable: false,
        );
  }
}