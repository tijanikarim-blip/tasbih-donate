import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/dummy_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.currentUser;

    return AppScaffold(
      navIndex: 4,
      title: 'المزيد',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Membership banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.gold, AppColors.softGold],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.workspace_premium, color: AppColors.darkText, size: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'المستوى ${user.level}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkText,
                            fontFamily: AppConstants.fontArabic,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'بارك الله لك في أعمالك',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.darkText,
                            fontFamily: AppConstants.fontArabic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_back_ios, color: AppColors.darkText, size: 18),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Menu items
            _buildMenuItem(Icons.favorite, 'المفضلة', () {}),
            _buildMenuItem(Icons.notifications, 'الإشعارات', () {}),
            _buildMenuItem(Icons.alarm, 'التنبيهات', () {}),
            _buildMenuItem(Icons.settings, 'الإعدادات', () {}),
            _buildMenuItem(Icons.language, 'اللغة', () {}),
            _buildMenuItem(Icons.help, 'المساعدة والدعم', () {}),
            _buildMenuItem(Icons.info, 'عن التطبيق', () {}),
            _buildMenuItem(Icons.bar_chart, 'التقارير المالية', () => context.go('/financial-reports')),
            const SizedBox(height: 24),
            // Emotional assistant shortcut
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardEmerald,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    'كيف تشعر اليوم؟',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ivory,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'اختر حالتك لنقترح عليك أذكاراً وأدعية مناسبة',
                    style: TextStyle(color: AppColors.mutedText, fontSize: 13, fontFamily: AppConstants.fontArabic),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.go('/emotional-assistant'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.darkText,
                    ),
                    child: const Text(
                      'اختر حالتك',
                      style: TextStyle(fontFamily: AppConstants.fontArabic, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Special occasions shortcut
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardEmerald,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    'أدعية المناسبات',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ivory,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'أدعية للحياة اليومية والمناسبات',
                    style: TextStyle(color: AppColors.mutedText, fontSize: 13, fontFamily: AppConstants.fontArabic),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.go('/occasion-duas'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.darkText,
                    ),
                    child: const Text(
                      'تصفح الأدعية',
                      style: TextStyle(fontFamily: AppConstants.fontArabic, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Logout
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.red,
                  side: const BorderSide(color: AppColors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'تسجيل الخروج',
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

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        leading: Icon(icon, color: AppColors.gold, size: 24),
        title: Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontFamily: AppConstants.fontArabic,
          ),
        ),
        trailing: const Icon(Icons.chevron_left, color: AppColors.mutedText),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
