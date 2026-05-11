class Dhikr {
  final String id;
  final String arabicText;
  final String transliteration;
  final String translation;
  final String source;
  final int recommendedCount;
  final String category;
  final List<String> tags;
  final bool hasAudio;
  final String? audioUrl;
  final String? reciterName;

  Dhikr({
    required this.id,
    required this.arabicText,
    required this.transliteration,
    required this.translation,
    required this.source,
    required this.recommendedCount,
    required this.category,
    this.tags = const [],
    this.hasAudio = false,
    this.audioUrl,
    this.reciterName,
  });
}
