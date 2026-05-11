import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/dummy_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final String projectId;

  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final items = DummyData.charityItems.where((i) => i.id == projectId && i.isProject).toList();
    final project = items.isNotEmpty ? items.first : DummyData.charityItems[5];

    return AppScaffold(
      navIndex: 2,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header image
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.emeraldGreen, AppColors.deepEmerald],
                ),
              ),
              child: Center(
                child: Icon(Icons.construction, size: 80, color: AppColors.gold.withValues(alpha: 0.4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ivory,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.mutedText,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Progress section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.cardEmerald,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: project.progress.clamp(0.0, 1.0),
                            backgroundColor: AppColors.deepEmerald,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.gold),
                            minHeight: 10,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildProgressStat('المبلغ المستهدف', '\$${project.targetAmount?.toStringAsFixed(0) ?? '0'}'),
                            _buildProgressStat('تم جمع', '\$${project.raisedAmount?.toStringAsFixed(0) ?? '0'}'),
                            _buildProgressStat('المتبرعون', '${project.contributorsCount ?? 0}'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (project.estimatedCompletion != null)
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, color: AppColors.mutedText, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                'تاريخ الانتهاء المتوقع: ${project.estimatedCompletion!.toLocal().toString().split(' ')[0]}',
                                style: const TextStyle(color: AppColors.mutedText, fontSize: 13, fontFamily: AppConstants.fontArabic),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // CTA button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: AppColors.darkText,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'تبرع الآن',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstants.fontArabic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share, color: AppColors.gold),
                        label: const Text('مشاركة', style: TextStyle(color: AppColors.gold, fontFamily: AppConstants.fontArabic)),
                      ),
                      const SizedBox(width: 24),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite, color: AppColors.gold),
                        label: const Text('حفظ', style: TextStyle(color: AppColors.gold, fontFamily: AppConstants.fontArabic)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.gold,
          ),
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
    );
  }
}
