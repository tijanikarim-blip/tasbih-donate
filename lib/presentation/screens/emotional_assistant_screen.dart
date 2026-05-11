import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/arabic_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class EmotionalAssistantScreen extends StatelessWidget {
  const EmotionalAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navIndex: 1,
      title: 'كيف تشعر اليوم؟',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'كيف تشعر اليوم؟',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ivory,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'اختر حالتك لنقترح عليك أذكاراً وأدعية مناسبة',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.mutedText,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              itemCount: ArabicData.emotionalStates.length,
              itemBuilder: (context, index) {
                final state = ArabicData.emotionalStates[index];
                return _buildMoodButton(context, state.emoji, state.label, state.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(BuildContext context, String emoji, String label, String moodId) {
    return GestureDetector(
      onTap: () => context.go('/recommendation/$moodId'),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardEmerald,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: AppConstants.fontArabic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
