class CharityItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final String impactMetric;
  final int impactCount;
  final bool isProject;
  final double? targetAmount;
  final double? raisedAmount;
  final int? contributorsCount;
  final DateTime? estimatedCompletion;
  final List<String> proofImages;

  CharityItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.impactMetric,
    required this.impactCount,
    this.isProject = false,
    this.targetAmount,
    this.raisedAmount,
    this.contributorsCount,
    this.estimatedCompletion,
    this.proofImages = const [],
  });

  double get progress =>
      targetAmount != null && targetAmount! > 0
          ? (raisedAmount ?? 0) / targetAmount!
          : 0;
}
