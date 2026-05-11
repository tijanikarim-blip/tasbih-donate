import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/arabic_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class RecommendationScreen extends StatelessWidget {
  final String mood;

  const RecommendationScreen({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    final states = ArabicData.emotionalStates.where((s) => s.id == mood).toList();
    final state = states.isNotEmpty ? states.first : ArabicData.emotionalStates.first;

    return AppScaffold(
      navIndex: 1,
      title: 'الذكر المقترح',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.emeraldGreen, AppColors.deepEmerald],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  Text(state.emoji, style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    '${state.emoji} ${state.label}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gold,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'الذكر المقترح',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.mutedText,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Main dhikr card
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
                  Text(
                    state.recommendedDhikr,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                      fontFamily: AppConstants.fontArabic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildActionCircle(Icons.play_arrow, () => context.go('/audio-player/dhikr')),
                      const SizedBox(width: 16),
                      _buildActionCircle(Icons.mosque, () {}),
                      const SizedBox(width: 16),
                      _buildActionCircle(Icons.favorite, () {}),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Recommended dua section
            const Text(
              'أدعية مقترحة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: AppConstants.fontArabic,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardEmerald,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
              ),
              child: Text(
                state.recommendedDua,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.ivory,
                  fontFamily: AppConstants.fontArabic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            // Quranic verse section
            const Text(
              'آيات مقترحة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: AppConstants.fontArabic,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardEmerald,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
              ),
              child: Column(
                children: [
                  Text(
                    state.quranicVerse,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gold,
                      fontFamily: AppConstants.fontArabic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCircle(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.gold,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: AppColors.goldGlow, blurRadius: 8)],
        ),
        child: Icon(icon, color: AppColors.darkText, size: 24),
      ),
    );
  }
}
