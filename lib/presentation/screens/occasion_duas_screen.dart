import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/arabic_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class OccasionDuasScreen extends StatelessWidget {
  const OccasionDuasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navIndex: 1,
      title: 'أدعية المناسبات',
      body: GridView.builder(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemCount: ArabicData.specialOccasions.length + 1,
        itemBuilder: (context, index) {
          if (index == ArabicData.specialOccasions.length) {
            return _buildOccasionButton('⋯', 'أخرى', () {});
          }
          final occasion = ArabicData.specialOccasions[index];
          return _buildOccasionButton(
            occasion.emoji,
            occasion.label,
            () => _showOccasionDialog(context, occasion),
          );
        },
      ),
    );
  }

  Widget _buildOccasionButton(String emoji, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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

  void _showOccasionDialog(BuildContext context, dynamic occasion) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardEmerald,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            Text(occasion.emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                occasion.label,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontFamily: AppConstants.fontArabic,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...occasion.duas.map((dua) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                dua,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.ivory,
                  fontFamily: AppConstants.fontArabic,
                ),
                textAlign: TextAlign.center,
              ),
            )),
            if (occasion.congratulationsMessage != null) ...[
              const Divider(color: AppColors.gold),
              Text(
                occasion.congratulationsMessage,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.softGold,
                  fontFamily: AppConstants.fontArabic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('إغلاق', style: TextStyle(color: AppColors.gold)),
          ),
        ],
      ),
    );
  }
}
