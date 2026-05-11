class TasbihSession {
  final String id;
  final String userId;
  final String dhikrId;
  final String dhikrText;
  final int count;
  final int targetCount;
  final DateTime startedAt;
  final DateTime? completedAt;

  TasbihSession({
    required this.id,
    required this.userId,
    required this.dhikrId,
    required this.dhikrText,
    required this.count,
    required this.targetCount,
    required this.startedAt,
    this.completedAt,
  });

  Duration get duration {
    final end = completedAt ?? DateTime.now();
    return end.difference(startedAt);
  }

  bool get isComplete => count >= targetCount;
  double get progress => count / targetCount;
}
