import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/dummy_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class AthariScreen extends StatelessWidget {
  const AthariScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.currentUser;

    return AppScaffold(
      navIndex: 3,
      title: 'أثري',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile summary
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.gold.withValues(alpha: 0.2),
                  child: const Icon(Icons.person, size: 36, color: AppColors.gold),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? 'مستخدم',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ivory,
                        fontFamily: AppConstants.fontArabic,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.gold.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'المستوى ${user.level}',
                        style: const TextStyle(
                          color: AppColors.gold,
                          fontSize: 13,
                          fontFamily: AppConstants.fontArabic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Statistics grid
            Row(
              children: [
                Expanded(child: _buildStatCard('التبرعات', '12', Icons.card_giftcard)),
                const SizedBox(width: 8),
                Expanded(child: _buildStatCard('المشاريع المدعومة', '3', Icons.construction)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildStatCard('الإعلانات المشاهدة', '${user.adsViewed}', Icons.visibility)),
                const SizedBox(width: 8),
                Expanded(child: _buildStatCard('مساهمتك التقديرية', '\$${user.estimatedAdContribution.toStringAsFixed(2)}', Icons.attach_money)),
              ],
            ),
            const SizedBox(height: 24),
            // Achievements
            const Text(
              'إنجازاتي',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: AppConstants.fontArabic,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAchievementBadge('🥇', 'أول تسبيحة'),
                  _buildAchievementBadge('🔥', 'سلسلة 7 أيام'),
                  _buildAchievementBadge('💎', '1000 تسبيحة'),
                  _buildAchievementBadge('🤲', 'متبرع'),
                  _buildAchievementBadge('🌟', 'داعم مشروع'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Impact proof photos
            const Text(
              'أثر تبرعاتك',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: AppConstants.fontArabic,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProofCard(),
                  _buildProofCard(),
                  _buildProofCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardEmerald,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.gold, size: 18),
              const SizedBox(width: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.mutedText,
              fontSize: 12,
              fontFamily: AppConstants.fontArabic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementBadge(String emoji, String label) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: AppColors.cardEmerald,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.mutedText,
              fontSize: 10,
              fontFamily: AppConstants.fontArabic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProofCard() {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: AppColors.emeraldGreen.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image, size: 40, color: AppColors.gold.withValues(alpha: 0.4)),
          const SizedBox(height: 8),
          const Icon(Icons.play_circle, color: AppColors.gold, size: 32),
        ],
      ),
    );
  }
}
