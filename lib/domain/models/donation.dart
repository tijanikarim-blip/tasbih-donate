class Donation {
  final String id;
  final String userId;
  final String charityItemId;
  final String charityTitle;
  final double amount;
  final DateTime date;
  final bool isCompleted;

  Donation({
    required this.id,
    required this.userId,
    required this.charityItemId,
    required this.charityTitle,
    required this.amount,
    required this.date,
    this.isCompleted = false,
  });
}
