class FinancialReport {
  final String id;
  final String title;
  final DateTime period;
  final double adRevenue;
  final double donationsReceived;
  final double operationalCosts;
  final double totalCharitySpent;
  final int completedProjects;
  final String? pdfUrl;

  FinancialReport({
    required this.id,
    required this.title,
    required this.period,
    required this.adRevenue,
    required this.donationsReceived,
    required this.operationalCosts,
    required this.totalCharitySpent,
    required this.completedProjects,
    this.pdfUrl,
  });

  double get totalFunds => adRevenue + donationsReceived;
  double get netCharityImpact => totalCharitySpent;
}
