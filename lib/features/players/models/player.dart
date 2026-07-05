class Player {
  final int? id;

  /// Identifiant unique permanent.
  final String uuid;

  /// Informations générales
  String firstName;
  String lastName;
  String? nickname;

  /// Contact
  String? email;
  String? mobilePhone;

  /// Informations personnelles
  DateTime? birthDate;
  String? comments;

  /// Identité visuelle
  String avatarId;

  /// Nom du fichier de la photo.
  /// Le chemin complet est reconstruit par PhotoStorageService.
  String? photoFileName;

  /// État du joueur
  bool active;

  /// Audit
  final DateTime createdAt;
  DateTime updatedAt;

  Player({
    this.id,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    this.nickname,
    this.email,
    this.mobilePhone,
    this.birthDate,
    this.comments,
    this.avatarId = 'male_01',
    
    this.photoFileName,
    this.active = true,
    required this.createdAt,
    required this.updatedAt,
  });

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  /// Nom complet.
  String get fullName => '$lastName $firstName';

  /// Nom affiché dans l'application.
  String get displayName => hasNickname ? nickname! : fullName;

  /// Le joueur possède un surnom.
  bool get hasNickname =>
      nickname != null && nickname!.trim().isNotEmpty;

  /// Le joueur possède une photo.
  bool get hasPhoto =>
      photoFileName != null && photoFileName!.isNotEmpty;

  /// Initiales du joueur.
  String get initials {
    final first = firstName.isNotEmpty ? firstName[0] : '';
    final last = lastName.isNotEmpty ? lastName[0] : '';

    return (first + last).toUpperCase();
  }

  /// Âge du joueur.
  int? get age {
    if (birthDate == null) {
      return null;
    }

    final today = DateTime.now();

    var age = today.year - birthDate!.year;

    if (today.month < birthDate!.month ||
        (today.month == birthDate!.month &&
            today.day < birthDate!.day)) {
      age--;
    }

    return age;
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Player copyWith({
    int? id,
    String? uuid,
    String? firstName,
    String? lastName,
    String? nickname,
    String? email,
    String? mobilePhone,
    DateTime? birthDate,
    String? comments,
    String? avatarId,
    String? photoFileName,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Player(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      mobilePhone: mobilePhone ?? this.mobilePhone,
      birthDate: birthDate ?? this.birthDate,
      comments: comments ?? this.comments,
      avatarId: avatarId ?? this.avatarId,
      photoFileName: photoFileName ?? this.photoFileName,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  //--------------------------------------------------------------------------
  // Mapping
  //--------------------------------------------------------------------------

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] as int?,
      uuid: map['uuid'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      nickname: map['nickname'] as String?,
      email: map['email'] as String?,
      mobilePhone: map['mobile_phone'] as String?,
      birthDate: map['birth_date'] != null
          ? DateTime.parse(map['birth_date'] as String)
          : null,
      comments: map['comments'] as String?,
      avatarId: (map['avatar_id'] as String?) ?? 'default_01',
      photoFileName: map['photo_file_name'] as String?,
      active: (map['active'] as int) == 1,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'first_name': firstName,
      'last_name': lastName,
      'nickname': nickname,
      'email': email,
      'mobile_phone': mobilePhone,
      'birth_date': birthDate?.toIso8601String(),
      'comments': comments,
      'avatar_id': avatarId,
      'photo_file_name': photoFileName,
      'active': active ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Player(id: $id, uuid: $uuid, fullName: $fullName)';
  }
}