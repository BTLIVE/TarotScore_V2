class AvatarService {
  AvatarService._();

  static final AvatarService instance = AvatarService._();

  static const String assetsPath = 'assets/avatars';

  static const String defaultAvatar = 'male_01';

  String asset(String avatarId) {
    return '$assetsPath/$avatarId.png';
  }

  String get defaultAsset => asset(defaultAvatar);

  List<String> get maleAvatars => List.generate(
        24,
        (i) => 'male_${(i + 1).toString().padLeft(2, '0')}',
      );

  List<String> get femaleAvatars => List.generate(
        24,
        (i) => 'female_${(i + 1).toString().padLeft(2, '0')}',
      );

  List<String> get allAvatars => [
        ...maleAvatars,
        ...femaleAvatars,
      ];
}