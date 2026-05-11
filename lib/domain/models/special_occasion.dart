class SpecialOccasion {
  final String id;
  final String emoji;
  final String label;
  final List<String> duas;
  final String? congratulationsMessage;
  final bool hasAudio;

  SpecialOccasion({
    required this.id,
    required this.emoji,
    required this.label,
    required this.duas,
    this.congratulationsMessage,
    this.hasAudio = false,
  });
}
