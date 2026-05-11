class UserProfile {
  final String id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final int totalTasbih;
  final int adsViewed;
  final int dailyStreak;
  final String level;
  final DateTime createdAt;

  UserProfile({
    required this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.totalTasbih = 0,
    this.adsViewed = 0,
    this.dailyStreak = 0,
    this.level = 'برونزي',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  double get estimatedAdContribution => (adsViewed / 1000) * 2.50;

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    int? totalTasbih,
    int? adsViewed,
    int? dailyStreak,
    String? level,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      totalTasbih: totalTasbih ?? this.totalTasbih,
      adsViewed: adsViewed ?? this.adsViewed,
      dailyStreak: dailyStreak ?? this.dailyStreak,
      level: level ?? this.level,
      createdAt: createdAt,
    );
  }
}
