import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/dummy_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class FinancialReportsScreen extends StatelessWidget {
  const FinancialReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final report = DummyData.financialReport;

    return AppScaffold(
      navIndex: 4,
      title: 'التقارير المالية',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Report header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.ivory,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: AppColors.goldGlow, blurRadius: 12),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.account_balance, size: 48, color: AppColors.emeraldGreen),
                  const SizedBox(height: 12),
                  Text(
                    report.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${report.period.year}/${report.period.month}',
                    style: const TextStyle(color: AppColors.mutedText, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Financial stats
            _buildReportRow('إجمالي إيرادات الإعلانات', '\$${report.adRevenue.toStringAsFixed(2)}', Icons.trending_up),
            _buildReportRow('إجمالي التبرعات', '\$${report.donationsReceived.toStringAsFixed(2)}', Icons.card_giftcard),
            _buildReportRow('المصاريف التشغيلية', '\$${report.operationalCosts.toStringAsFixed(2)}', Icons.receipt),
            _buildReportRow('إجمالي المصروفات الخيرية', '\$${report.totalCharitySpent.toStringAsFixed(2)}', Icons.favorite),
            _buildReportRow('المشاريع المكتملة', '${report.completedProjects}', Icons.check_circle),
            const SizedBox(height: 24),
            // Totals card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.emeraldGreen, AppColors.deepEmerald],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    'إجمالي الأموال',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.softGold,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${report.totalFunds.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'صافي الأثر الخيري: \$${report.netCharityImpact.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 14,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Download button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.darkText,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text(
                  'تحميل التقرير (PDF)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstants.fontArabic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportRow(String label, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardEmerald,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.ivory,
                fontSize: 14,
                fontFamily: AppConstants.fontArabic,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.gold,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
